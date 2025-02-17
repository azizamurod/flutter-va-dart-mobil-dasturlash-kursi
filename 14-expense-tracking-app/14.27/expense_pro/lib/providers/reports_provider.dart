import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:story/story_page_view.dart';

import '/data/hive/hive_db.dart';
import '/data/drift/drift_db.dart';

import '/data/models/budget_model.dart';
import '/data/models/transaction_model.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/functions/format_date_time.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_months_from_signup.dart';
import '/utils/functions/categorize_transactions.dart';
import '/utils/functions/gen_date_time_from_month_string.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

class ReportsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  /// overview
  final _indicatorAnimationController =
      ValueNotifier<IndicatorAnimationCommand>(
    IndicatorAnimationCommand.resume,
  );
  Color _overviewScreenBgColor = const Color.fromRGBO(253, 60, 74, 1);
  int _storyIndex = 0;
  int _storyLength = 4;
  double _totalExpenseAmount = 0;
  TransactionModel? _biggestExpense;
  double _totalIncomeAmount = 0;
  TransactionModel? _biggestIncome;
  int _allBudgetsCount = 0;
  List<BudgetModel> _budgetsExeedingLimit = [];

  ValueNotifier<IndicatorAnimationCommand> get indicatorAnimationController =>
      _indicatorAnimationController;
  Color get overviewScreenBgColor => _overviewScreenBgColor;
  int get storyIndex => _storyIndex;
  int get storyLength => _storyLength;
  double get totalExpenseAmount => _totalExpenseAmount;
  TransactionModel? get biggestExpense => _biggestExpense;
  double get totalIncomeAmount => _totalIncomeAmount;
  TransactionModel? get biggestIncome => _biggestIncome;
  int get allBudgetsCount => _allBudgetsCount;
  List<BudgetModel> get budgetsExeedingLimit => _budgetsExeedingLimit;

  /// detail
  List<String> _months = [];
  final List<String> _years =
      getYearsFromSignup(HiveDb.signedUpDate ?? DateTime.now());
  String? _selectedMonth;
  String? _selectedYear;
  bool _isLineGraph = true;
  TransactionTypes _transactionType = TransactionTypes.expense;
  double _allExpenseAmount = 0;
  double _allIncomeAmount = 0;
  double _biggestExpenseAmount = 0;
  List<ChartLineDataItem> _lineGraphData = [];
  List<ChartGroupPieDataItem> _pieChartData = [];

  List<String> get months => _months;
  List<String> get years => _years;
  String? get selectedMonth => _selectedMonth;
  String? get selectedYear => _selectedYear;
  bool get isLineGraph => _isLineGraph;
  TransactionTypes get transactionType => _transactionType;
  double get allExpenseAmount => _allExpenseAmount;
  double get allIncomeAmount => _allIncomeAmount;
  double get biggestExpenseAmount => _biggestExpenseAmount;
  List<ChartLineDataItem> get lineGraphData => _lineGraphData;
  List<ChartGroupPieDataItem> get pieChartData => _pieChartData;

  List<TransactionModel> _expenses = [];
  List<TransactionModel> _incomes = [];
  List<Map<String, dynamic>> _categorizedExpenses = [];
  List<Map<String, dynamic>> _categorizedIncomes = [];
  TransactionCategories? _expenseCategory;
  TransactionCategories? _incomeCategory;

  List<TransactionModel> get expenses {
    return _expenseCategory == null
        ? _expenses
        : _expenses.where((el) => el.category == _expenseCategory).toList();
  }

  List<TransactionModel> get incomes {
    return _incomeCategory == null
        ? _incomes
        : _incomes.where((el) => el.category == _incomeCategory).toList();
  }

  List<Map<String, dynamic>> get categorizedExpenses {
    return _expenseCategory == null
        ? _categorizedExpenses
        : _categorizedExpenses
            .where((el) => el['category'] == _expenseCategory)
            .toList();
  }

  List<Map<String, dynamic>> get categorizedIncomes {
    return _incomeCategory == null
        ? _categorizedIncomes
        : _categorizedIncomes
            .where((el) => el['category'] == _incomeCategory)
            .toList();
  }

  TransactionCategories? get expenseCategory => _expenseCategory;
  TransactionCategories? get incomeCategory => _incomeCategory;

  void changeOverviewScreenBgColor(int index) {
    if (_storyIndex == index) return;
    _storyIndex = index;
    _overviewScreenBgColor = index == 0
        ? const Color.fromRGBO(253, 60, 74, 1)
        : (index == 1
            ? const Color.fromRGBO(0, 168, 107, 1)
            : const Color.fromRGBO(127, 61, 255, 1));
    notifyListeners();
  }

  void getDataForOverviewScreen() async {
    _storyLength = 4;
    _totalExpenseAmount = 0;
    _biggestExpense = null;
    _totalIncomeAmount = 0;
    _biggestIncome = null;
    _allBudgetsCount = 0;
    _budgetsExeedingLimit = [];

    final transactions = await driftDb.getTransactionsByTimeFrame(
      'Month',
    );

    for (final transaction in transactions) {
      if (transaction.type == TransactionTypes.expense) {
        _totalExpenseAmount += transaction.amount ?? 0;
        if ((transaction.amount ?? 0) > (_biggestExpense?.amount ?? 0)) {
          _biggestExpense = transaction;
        }
      } else if (transaction.type == TransactionTypes.income) {
        _totalIncomeAmount += transaction.amount ?? 0;
        if ((transaction.amount ?? 0) > (_biggestIncome?.amount ?? 0)) {
          _biggestIncome = transaction;
        }
      }
    }

    final budgets = await driftDb.getAllBudgets();
    _allBudgetsCount = budgets.length;
    if (budgets.isEmpty) _storyLength = 3;
    for (final budget in budgets) {
      if ((budget.currentAmount ?? 0) > (budget.estimatedAmount ?? 0)) {
        _budgetsExeedingLimit.add(budget);
      }
    }

    notifyListeners();
  }

  /// detail
  void initializeDetailScreen(BuildContext context) {
    _selectedYear = years.first;
    _months = getOnlyMonths(
      genDateTimeFromYearString(
        _selectedYear ?? DateTime.now().year.toString(),
      ),
      context,
    );
    _selectedMonth = _months.first;
    getTransactionsData(context);
  }

  void selectMonth(String val, BuildContext context,) {
    if (val == _selectedMonth) {
      _selectedMonth = null;
    } else {
      _selectedMonth = val;
    }
    getTransactionsData(context);
    notifyListeners();
  }

  void selectYear(
    String val,
    BuildContext context,
  ) {
    if (val == _selectedYear) return;

    _selectedYear = val;
    _months = getOnlyMonths(
      genDateTimeFromYearString(val),
      context,
    );
    _selectedMonth = null;
    getTransactionsData(context);
    notifyListeners();
  }

  void changeIsLineGraph(bool val) {
    if (val == _isLineGraph) return;

    _isLineGraph = val;
    notifyListeners();
  }

  void changeTransactionType(TransactionTypes val) {
    if (val == _transactionType) return;

    _transactionType = val;
    notifyListeners();
  }

  Future<void> getTransactionsData(BuildContext context) async {
    _expenses = await driftDb.getTransactionsByTimeFrame(
      _selectedMonth != null ? 'Month' : 'Year',
      type: TransactionTypes.expense,
      dateTime: _selectedMonth != null
          ? genDateTimeFromMonthString(
              '$_selectedMonth, $_selectedYear',
              context,
            )
          : genDateTimeFromYearString(
              _selectedYear ?? DateTime.now().year.toString(),
            ),
    );
    _incomes = await driftDb.getTransactionsByTimeFrame(
      _selectedMonth != null ? 'Month' : 'Year',
      type: TransactionTypes.income,
      dateTime: _selectedMonth != null
          ? genDateTimeFromMonthString('$_selectedMonth, $_selectedYear', context,)
          : genDateTimeFromYearString(
              _selectedYear ?? DateTime.now().year.toString(),
            )
    );

    _allExpenseAmount = _expenses.fold(0, (sum, el) => sum + (el.amount ?? 0));
    _allIncomeAmount = _incomes.fold(0, (sum, el) => sum + (el.amount ?? 0));
    _biggestExpenseAmount = expenses.fold(
      0,
      (initial, el) => initial > (el.amount ?? 0) ? initial : (el.amount ?? 0),
    );
    _categorizedExpenses = categorizeTransactions(_expenses);
    _categorizedIncomes = categorizeTransactions(_incomes);

    _lineGraphData = [];
    _pieChartData = [];

    for (TransactionModel expense in expenses) {
      double xValue =
          (expense.createdDateTime ?? DateTime.now()).day.toDouble() +
              (_selectedMonth != null
                  ? 0
                  : (expense.createdDateTime ?? DateTime.now()).month * 31);
      double yValue = expense.amount ?? 0;

      int index = _lineGraphData.indexWhere((el) => el.x == xValue);

      if (index == -1) {
        _lineGraphData.add(
          ChartLineDataItem(value: yValue, x: xValue),
        );
      } else {
        if (_lineGraphData[index].value < yValue) {
          _lineGraphData[index] = ChartLineDataItem(value: yValue, x: xValue);
        }
      }
    }

    if (_lineGraphData.length == 1) {
      _lineGraphData.add(
        ChartLineDataItem(
          value: _lineGraphData.first.value + 0.1,
          x: _lineGraphData.first.x,
        ),
      );
    }

    _lineGraphData.sort((a, b) => a.x.compareTo(b.x));

    for (Map<String, dynamic> category in categorizedExpenses) {
      _pieChartData.add(
        ChartGroupPieDataItem(
          amount: category['amount'],
          color: category['color'],
          label: getTextForTransactionCategories(category['category'], context,),
        ),
      );
    }
    notifyListeners();
  }

  void selectExpenseCategory(TransactionCategories val) {
    if (val == _expenseCategory) {
      _expenseCategory = null;
    } else {
      _expenseCategory = val;
    }
    notifyListeners();
  }

  void selectIncomeCategory(TransactionCategories val) {
    if (val == _incomeCategory) {
      _incomeCategory = null;
    } else {
      _incomeCategory = val;
    }
    notifyListeners();
  }
}
