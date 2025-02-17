import '/data/drift/drift_db.dart';

import '/utils/contants/transaction_categories.dart';
import '/utils/functions/string_to_transaction_categories.dart';

class BudgetModel {
  int? id;
  double? estimatedAmount;
  TransactionCategories? category;
  bool? receiveAlert;
  int? alertPercentage;
  double? currentAmount;

  BudgetModel({
    this.id,
    this.estimatedAmount,
    this.category,
    this.receiveAlert,
    this.alertPercentage,
    this.currentAmount,
  });

  factory BudgetModel.fromRow(
    Budget budget, {
    double? currentAmount,
  }) {
    return BudgetModel(
      id: budget.id,
      estimatedAmount: budget.estimatedAmount,
      category: stringToTransactionCategories(budget.category),
      receiveAlert: budget.receiveAlert,
      alertPercentage: budget.alertPercentage,
      currentAmount: currentAmount,
    );
  }
}
