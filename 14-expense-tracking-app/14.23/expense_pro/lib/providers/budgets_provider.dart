
import 'package:flutter/material.dart';

import '/data/drift/drift_db.dart';

import '/data/models/budget_model.dart';

import '/utils/functions/show_error_alert.dart';
import '/utils/functions/format_double_string.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/dialogs/show_deleted_dialog.dart';

class BudgetsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  List<BudgetModel> _budgets = [];
  List<BudgetModel> get budgets => _budgets;

  TextEditingController _budgetAmountController =
      TextEditingController(text: '0');
  BudgetModel _budgetForCreation = BudgetModel(
    receiveAlert: false,
    alertPercentage: 80,
  );

  TextEditingController get budgetAmountController => _budgetAmountController;
  BudgetModel get budgetForCreation => _budgetForCreation;
  final List<TransactionCategories> _categories =
      List.from(expenseCategoriesList);

  BudgetModel? _detailBudget;
  BudgetModel? get detailBudget => _detailBudget;
  List<TransactionCategories> get categories => _categories;

  /// list
  void getAllBudgets() async {
    _budgets = await driftDb.getAllBudgets();
    for (final budget in _budgets) {
      _categories.remove(budget.category);
    }
    notifyListeners();
  }

  /// create
  void selectCategory(TransactionCategories val) {
    if (_budgetForCreation.category == val) return;

    _budgetForCreation.category = val;
    notifyListeners();
  }

  void toggleReceiveAlert() {
    _budgetForCreation.receiveAlert =
        !(_budgetForCreation.receiveAlert ?? false);
    notifyListeners();
  }

  void setReceiveAlertPercentage(double val) {
    if (_budgetForCreation.alertPercentage == val.toInt()) return;

    _budgetForCreation.alertPercentage = val.toInt();
    notifyListeners();
  }

  void createBudget(BuildContext context) async {
    if (_budgetAmountController.text == '0') {
      showErrorAlert(context, 'Please enter budget amount !');
      notifyListeners();
      return;
    }

    if (_budgetForCreation.category == null) {
      showErrorAlert(context, 'Please select category !');
      notifyListeners();
      return;
    }

    if (_budgetForCreation.receiveAlert == true &&
        _budgetForCreation.alertPercentage == 0) {
      showErrorAlert(
        context,
        'Receive alert percentage should be higher than 0 !',
      );
      notifyListeners();
      return;
    }

    _budgetForCreation.estimatedAmount =
        (double.tryParse(_budgetAmountController.text)) ?? 0;
    await driftDb.createBudget(_budgetForCreation);
    getAllBudgets();
    resetCreateBudgetScreen();
    Navigator.pop(context);
  }

  void resetCreateBudgetScreen() {
    _budgetAmountController = TextEditingController(text: '0');
    _budgetForCreation = BudgetModel(
      receiveAlert: false,
      alertPercentage: 80,
    );
  }

  /// detail
  void initializeDetailBudgetScreen(BudgetModel budget) {
    _detailBudget = budget;
  }

  void removeBudget(BuildContext context) async {
    await driftDb.deleteBudget(_detailBudget!.id!);
    getAllBudgets();
    Navigator.pop(context);
    showDeletedDialog(context: context, text: 'Budget');
  }

  /// edit
  void initEditBudgetScreen() {
    _budgetAmountController = TextEditingController(
      text:
          (formatDoubleString(_detailBudget?.estimatedAmount ?? 0)).toString(),
    );
    _budgetForCreation = _detailBudget!;
  }

  void onTapCategoryInEditScreen(BuildContext context) {
    showErrorAlert(
      context,
      'You can\'t edit budget\'s category',
    );
    notifyListeners();
  }

  void editBudget(BuildContext context) async {
    if (_budgetAmountController.text == '0') {
      showErrorAlert(context, 'Please enter budget amount !');
      notifyListeners();
      return;
    }

    if (_budgetForCreation.receiveAlert == true &&
        _budgetForCreation.alertPercentage == 0) {
      showErrorAlert(
        context,
        'Receive alert percentage should be higher than 0 !',
      );
      notifyListeners();
      return;
    }

    _budgetForCreation.estimatedAmount =
        (double.tryParse(_budgetAmountController.text)) ?? 0;
    await driftDb.editBudget(_budgetForCreation);
    getAllBudgets();
    resetCreateBudgetScreen();
    Navigator.pop(context);
  }
}
