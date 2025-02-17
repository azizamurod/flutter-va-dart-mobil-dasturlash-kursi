import '/utils/contants/transaction_types.dart';

String getTextForTransactionTypes(TransactionTypes type) {
  String result = '';

  switch (type) {
    case TransactionTypes.income:
      result = 'Income';
      break;
    case TransactionTypes.transfer:
      result = 'Transfer';
      break;
    case TransactionTypes.expense:
      result = 'Expense';
      break;
  }

  return result;
}
