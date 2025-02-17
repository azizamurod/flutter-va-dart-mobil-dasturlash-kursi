import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/data/hive/hive_db.dart';
import '/data/drift/drift_db.dart';

import '/data/models/account_model.dart';
import '/data/models/transaction_model.dart';

import '/utils/contants/sorting_types.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/functions/show_error_alert.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_months_from_signup.dart';
import '/utils/functions/gen_date_time_from_month_string.dart';

import '/widgets/dialogs/show_deleted_dialog.dart';

class TransactionsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  List<TransactionModel> _transactionsForAccount = [];
  List<TransactionModel> get transactionsForAccount => _transactionsForAccount;

  TextEditingController _amountController = TextEditingController(text: '0');
  TextEditingController _descriptionController = TextEditingController();
  TransactionModel? _transactionForCreation = TransactionModel();

  TextEditingController get amountController => _amountController;
  TextEditingController get descriptionController => _descriptionController;
  TransactionModel? get transactionForCreation => _transactionForCreation;

  List<String> _monthsFromSignup = [];
  String _selectedMonth = '';
  String _selectedMonthForTransactions = '';

  List<String> get monthsFromSignup => _monthsFromSignup;
  String get selectedMonth => _selectedMonth;
  String get selectedMonthForTransactions => _selectedMonthForTransactions;

  double _expenseAmount = 0;
  double _incomeAmount = 0;
  double _biggestExpenseAmount = 0;
  List<ChartLineDataItem> _spendingGraphData = [];
  String _transactionsSwitcherValue = 'Today';
  List<TransactionModel> _recentTransactions = [];
  bool _hasTransactions = false;
  List<TransactionModel> _transactions = [];

  double get expenseAmount => _expenseAmount;
  double get incomeAmount => _incomeAmount;
  double get biggestExpenseAmount => _biggestExpenseAmount;
  List<ChartLineDataItem> get spendingGraphData => _spendingGraphData;
  String get transactionsSwitcherValue => _transactionsSwitcherValue;
  List<TransactionModel> get recentTransactions => _recentTransactions;
  bool get hasTransactions => _hasTransactions;
  List<TransactionModel> get transactions => _transactions;

  /// filtration
  TransactionTypes? _transactionType;
  SortingTypes? _sorting;
  List<TransactionCategories?> _categories = [];

  TransactionTypes? get transactionType => _transactionType;
  SortingTypes? get sorting => _sorting;
  List<TransactionCategories?> get categories => _categories;

  /// detail
  TransactionModel? _detailTransaction;
  TransactionModel? get detailTransaction => _detailTransaction;

  /// account detail
  void getTransactionsForAccount(int accountId) async {
    _transactionsForAccount = [];
    _transactionsForAccount = await driftDb.getTransactionsForAccount(
      accountId,
    );
    notifyListeners();
  }

  Map<String, List<TransactionModel>> separateTransactionsByDate(
    List<TransactionModel> transactions,
  ) {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    List<TransactionModel> todayTransactions = [];
    List<TransactionModel> yesterdayTransactions = [];
    List<TransactionModel> beforeTransactions = [];

    for (TransactionModel transaction in transactions) {
      DateTime transactionDateTime =
          transaction.createdDateTime ?? DateTime.now();

      if (transactionDateTime.isAfter(todayStart)) {
        todayTransactions.add(transaction);
      } else if (transactionDateTime.isAfter(yesterdayStart) &&
          transactionDateTime.isBefore(todayStart)) {
        yesterdayTransactions.add(transaction);
      } else {
        beforeTransactions.add(transaction);
      }
    }

    return {
      'today': todayTransactions,
      'yesterday': yesterdayTransactions,
      'before': beforeTransactions,
    };
  }

  /// create expense, income, transfer
  void initializeCreateScreen(TransactionTypes val) {
    _transactionForCreation = TransactionModel(type: val);
  }

  void selectCategory(TransactionCategories val) {
    _transactionForCreation?.category = val;
    notifyListeners();
  }

  void selectAccount(
    Account account, {
    bool secondAccount = false,
  }) {
    if (!secondAccount) {
      _transactionForCreation?.account = AccountModel(
        id: account.id,
        name: account.name,
        balance: account.balance,
      );
    } else {
      _transactionForCreation?.account2 = AccountModel(
        id: account.id,
        name: account.name,
        balance: account.balance,
      );
    }
    notifyListeners();
  }

  void createTransaction(BuildContext context) async {
    // errors
    if (_amountController.text == '0') {
      showErrorAlert(context, 'Please enter amount !');
      notifyListeners();
      return;
    }
    if (_transactionForCreation?.category == null &&
        _transactionForCreation?.type != TransactionTypes.transfer) {
      showErrorAlert(context, 'Please select category !');
      notifyListeners();
      return;
    }
    if (_transactionForCreation?.account == null) {
      showErrorAlert(context, 'Please select account !');
      notifyListeners();
      return;
    }
    if (_transactionForCreation?.account2 == null &&
        _transactionForCreation?.type == TransactionTypes.transfer) {
      showErrorAlert(context, 'Please select second account !');
      notifyListeners();
      return;
    }
    if ((_transactionForCreation!.account!.balance <
            (double.tryParse(_amountController.text) ?? 0) &&
        _transactionForCreation!.type != TransactionTypes.income)) {
      showErrorAlert(context,
          'Transaction\'s amount should not be greater than account\'s balance !');
      notifyListeners();
      return;
    }

    _transactionForCreation?.amount =
        double.tryParse(_amountController.text) ?? 0;
    _transactionForCreation?.description = _descriptionController.text;
    _transactionForCreation?.createdDateTime = DateTime.now();
    if (_transactionForCreation?.type == TransactionTypes.transfer) {
      _transactionForCreation?.category = TransactionCategories.transfer;
    }
    await driftDb.createTransaction(_transactionForCreation!);

    // account balance changes
    if (_transactionForCreation?.type == TransactionTypes.expense ||
        _transactionForCreation?.type == TransactionTypes.transfer) {
      await driftDb.editAccount(
        id: _transactionForCreation!.account!.id,
        name: _transactionForCreation!.account!.name,
        balance: _transactionForCreation!.account!.balance -
            _transactionForCreation!.amount!,
      );
    }
    if (_transactionForCreation?.type == TransactionTypes.income) {
      await driftDb.editAccount(
        id: _transactionForCreation!.account!.id,
        name: _transactionForCreation!.account!.name,
        balance: _transactionForCreation!.account!.balance +
            _transactionForCreation!.amount!,
      );
    }
    if (_transactionForCreation?.type == TransactionTypes.transfer) {
      await driftDb.editAccount(
        id: _transactionForCreation!.account2!.id,
        name: _transactionForCreation!.account2!.name,
        balance: _transactionForCreation!.account2!.balance +
            _transactionForCreation!.amount!,
      );
    }

    resetCreateScreen();
    getIncomeAndExpenseAmount(
      genDateTimeFromMonthString(_selectedMonth),
    );
    getRecentTransactions();
    getTransactions();
    context.read<BudgetsProvider>().getAllBudgets();
    Navigator.pop(context);
  }

  void resetCreateScreen() {
    _amountController = TextEditingController(text: '0');
    _descriptionController = TextEditingController();
    _transactionForCreation = TransactionModel();
  }

  /// home
  void getAllMonthsFromSignup() {
    _monthsFromSignup = getMonthsFromSignup(
      HiveDb.signedUpDate ?? DateTime.now(),
    );
    _selectedMonth = _monthsFromSignup.first;
    _selectedMonthForTransactions = _monthsFromSignup.first;
    getIncomeAndExpenseAmount(
      genDateTimeFromMonthString(_selectedMonth),
    );
    getTransactions();
  }

  void selectMonth(
    String val, {
    bool forTransactionsScreen = false,
  }) {
    if (forTransactionsScreen) {
      if (_selectedMonthForTransactions == val) return;
      _selectedMonthForTransactions = val;
    } else {
      if (_selectedMonth == val) return;
      _selectedMonth = val;
      getIncomeAndExpenseAmount(
        genDateTimeFromMonthString(_selectedMonth),
      );
      getTransactions();
    }
    notifyListeners();
  }

  Future<void> getIncomeAndExpenseAmount(DateTime month) async {
    List<Transaction> expenses = await driftDb.getAllExpense(month);
    List<Transaction> incomes = await driftDb.getAllIncome(month);
    _expenseAmount = expenses.fold(0, (sum, el) => sum + el.amount);
    _incomeAmount = incomes.fold(0, (sum, el) => sum + el.amount);
    _biggestExpenseAmount = expenses.fold(
        0,
        (initial, transaction) =>
            initial > transaction.amount ? initial : transaction.amount);
    _spendingGraphData = [];

    for (Transaction expense in expenses) {
      double xValue = DateTime.parse(expense.createdDateTime).day.toDouble();
      double yValue = expense.amount;

      int index = _spendingGraphData.indexWhere((el) => el.x == xValue);

      if (index == -1) {
        _spendingGraphData.add(
          ChartLineDataItem(value: yValue, x: xValue),
        );
      } else {
        if (_spendingGraphData[index].value < yValue) {
          _spendingGraphData[index] =
              ChartLineDataItem(value: yValue, x: xValue);
        }
      }
    }

    if (_spendingGraphData.length == 1) {
      _spendingGraphData.add(
        ChartLineDataItem(
          value: _spendingGraphData.first.value + 0.1,
          x: _spendingGraphData.first.x,
        ),
      );
    }

    notifyListeners();
  }

  Future<void> getRecentTransactions() async {
    _recentTransactions = await driftDb.getTransactionsByTimeFrame(
      _transactionsSwitcherValue,
    );

    if (!_hasTransactions &&
        (await driftDb.getTransactionsByTimeFrame('Month')).isNotEmpty) {
      _hasTransactions = true;
    }
    notifyListeners();
  }

  void changeTransactionsSwitcherValue(String val) {
    if (val == _transactionsSwitcherValue) return;

    _transactionsSwitcherValue = val;
    getRecentTransactions();
    notifyListeners();
  }

  /// transactions
  Future<void> getTransactions() async {
    _transactions = await driftDb.getTransactionsByTimeFrame(
      'Month',
      dateTime: genDateTimeFromMonthString(_selectedMonthForTransactions),
      type: _transactionType,
      sorting: _sorting,
      categories: _categories,
    );
    notifyListeners();
  }

  bool hasFilters() {
    return _transactionType != null ||
        _sorting != null ||
        _categories.isNotEmpty;
  }

  void reset() {
    _transactionType = null;
    _sorting = null;
    _categories = [];
    getTransactions();
  }

  void applyFilters({
    TransactionTypes? type,
    SortingTypes? sorting,
    List<TransactionCategories?> categories = const [],
  }) {
    _transactionType = type;
    _sorting = sorting;
    _categories = categories;
    notifyListeners();
    getTransactions();
  }

  /// detail
  void goToTransactionDetailScreen({
    required BuildContext context,
    required TransactionModel transaction,
  }) {
    if (transaction.type == TransactionTypes.income) {
      Navigator.pushNamed(context, '/income-detail');
    } else if (transaction.type == TransactionTypes.expense) {
      Navigator.pushNamed(context, '/expense-detail');
    } else {
      Navigator.pushNamed(context, '/transfer-detail');
    }
    _detailTransaction = transaction;
  }

  void removeTransaction(BuildContext context) async {
    await driftDb.deleteTransaction(_detailTransaction!.id!);
    getIncomeAndExpenseAmount(
      genDateTimeFromMonthString(_selectedMonth),
    );
    getRecentTransactions();
    getTransactions();
    context.read<BudgetsProvider>().getAllBudgets();

    Navigator.pop(context);
    showDeletedDialog(context: context, text: 'Transaction');
  }
}
