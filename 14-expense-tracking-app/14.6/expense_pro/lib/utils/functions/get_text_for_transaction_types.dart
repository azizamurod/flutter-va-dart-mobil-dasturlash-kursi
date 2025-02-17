import '/utils/contants/transaction_types.dart';

String getTextForTransactionTypes(TransactionTypes type) {
  String result = '';

  switch (type) {
    case TransactionTypes.income:
      result = 'income';
      break;
    case TransactionTypes.transfer:
      result = 'transfer';
      break;
    case TransactionTypes.expense:
      result = 'expense';
      break;
  }
  
  return result;
}
