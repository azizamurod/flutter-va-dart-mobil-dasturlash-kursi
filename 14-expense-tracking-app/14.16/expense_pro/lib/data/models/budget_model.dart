import '/utils/contants/transaction_categories.dart';

class BudgetModel {
  final int id;
  final double estimatedAmount;
  final TransactionCategories category;
  final bool receiveAlert;
  final int alertPercentage;
  final double currentAmount;

  BudgetModel({
    required this.id,
    required this.estimatedAmount,
    required this.category,
    required this.receiveAlert,
    required this.alertPercentage,
    required this.currentAmount,
  });
}
