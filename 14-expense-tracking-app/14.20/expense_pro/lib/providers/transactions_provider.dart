import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '/data/hive/hive_db.dart';
import '/data/drift/drift_db.dart';

import '/data/models/account_model.dart';
import '/data/models/transaction_model.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/functions/show_error_alert.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_months_from_signup.dart';
import '/utils/functions/gen_date_time_from_month_string.dart';

class TransactionsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  List<Transaction> _transactionsForAccount = [];
  List<Transaction> get transactionsForAccount => _transactionsForAccount;

  TextEditingController _amountController = TextEditingController(text: '0');
  TextEditingController _descriptionController = TextEditingController();
  TransactionModel? _transactionForCreation = TransactionModel();

  TextEditingController get amountController => _amountController;
  TextEditingController get descriptionController => _descriptionController;
  TransactionModel? get transactionForCreation => _transactionForCreation;

  List<String> _monthsFromSignup = [];
  String _selectedMonth = '';

  List<String> get monthsFromSignup => _monthsFromSignup;
  String get selectedMonth => _selectedMonth;

  double _expenseAmount = 0;
  double _incomeAmount = 0;
  double _biggestExpenseAmount = 0;
  List<ChartLineDataItem> _spendingGraphData = [];
  String _transactionsSwitcherValue = 'Today';
  List<Transaction> _recentTransactions = [];
  bool _hasTransactions = false;

  double get expenseAmount => _expenseAmount;
  double get incomeAmount => _incomeAmount;
  double get biggestExpenseAmount => _biggestExpenseAmount;
  List<ChartLineDataItem> get spendingGraphData => _spendingGraphData;
  String get transactionsSwitcherValue => _transactionsSwitcherValue;
  List<Transaction> get recentTransactions => _recentTransactions;
  bool get hasTransactions => _hasTransactions;

  /// account detail
  void getTransactionsForAccount(int accountId) async {
    _transactionsForAccount = [];
    _transactionsForAccount = await driftDb.getTransactionsForAccount(
      accountId,
    );
    notifyListeners();
  }

  Map<String, List<Transaction>> separateTransactionsByDate(
    List<Transaction> transactions,
  ) {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    List<Transaction> todayTransactions = [];
    List<Transaction> yesterdayTransactions = [];
    List<Transaction> beforeTransactions = [];

    for (Transaction transaction in transactions) {
      DateTime transactionDateTime =
          DateTime.parse(transaction.createdDateTime);

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

  void createAccount(BuildContext context) async {
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
    getIncomeAndExpenseAmount(
      genDateTimeFromMonthString(_selectedMonth),
    );
  }

  void selectMonth(String val) {
    if (_selectedMonth == val) return;

    _selectedMonth = val;
    getIncomeAndExpenseAmount(
      genDateTimeFromMonthString(_selectedMonth),
    );
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
    _recentTransactions = await driftDb.getTransactionByTimeFrame(
      _transactionsSwitcherValue,
    );

    if (!_hasTransactions &&
        (await driftDb.getTransactionByTimeFrame('Month')).isNotEmpty) {
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
}
