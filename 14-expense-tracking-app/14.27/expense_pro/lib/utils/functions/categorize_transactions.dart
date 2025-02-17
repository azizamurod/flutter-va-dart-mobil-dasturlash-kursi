import '/data/models/transaction_model.dart';

import '/utils/functions/gen_random_color.dart';
import '/utils/contants/transaction_categories.dart';

List<Map<String, dynamic>> categorizeTransactions(
  List<TransactionModel> transactions,
) {
  Map<TransactionCategories, double> categorizedMap = {};

  for (TransactionModel transaction in transactions) {
    TransactionCategories? category = transaction.category;
    double amount = transaction.amount ?? 0;

    if (category != null) {
      categorizedMap[category] = (categorizedMap[category] ?? 0) + amount;
    }
  }

  return categorizedMap.entries
      .map((entry) => {
            'category': entry.key,
            'amount': entry.value,
            'color': genRandomColor(),
          })
      .toList();
}
