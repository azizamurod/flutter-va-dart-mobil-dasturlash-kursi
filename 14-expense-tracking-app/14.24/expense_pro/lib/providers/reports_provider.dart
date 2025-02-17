import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';

import '/data/drift/drift_db.dart';

import '/data/models/budget_model.dart';
import '/data/models/transaction_model.dart';

import '/utils/contants/transaction_types.dart';

class ReportsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

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
}
