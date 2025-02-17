import '/utils/contants/transaction_categories.dart';

TransactionCategories stringToTransactionCategories(String value) {
  return TransactionCategories.values.firstWhere(
    (category) => category.toString() == value,
  );
}
