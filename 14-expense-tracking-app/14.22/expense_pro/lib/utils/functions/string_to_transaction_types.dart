import '/utils/contants/transaction_types.dart';

TransactionTypes stringToTransactionTypes(String value) {
  return TransactionTypes.values.firstWhere(
    (type) => type.toString() == value,
  );
}
