import '/data/drift/drift_db.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/string_to_transaction_types.dart';
import '/utils/functions/string_to_transaction_categories.dart';

import '/data/models/account_model.dart';

class TransactionModel {
  int? id;
  TransactionTypes? type;
  TransactionCategories? category;
  AccountModel? account;
  AccountModel? account2;
  String description;
  double? amount;
  DateTime? createdDateTime;

  TransactionModel({
    this.id,
    this.type,
    this.category,
    this.account,
    this.account2,
    this.description ='',
    this.amount,
    this.createdDateTime,
  });

  factory TransactionModel.fromRow({
    required Transaction transaction,
    Account? account1,
    Account? account2,
  }) {
    return TransactionModel(
      id: transaction.id,
      type: stringToTransactionTypes(transaction.type),
      category: stringToTransactionCategories(transaction.category),
      account: account1 != null
          ? AccountModel(
              id: account1.id,
              name: account1.name,
              balance: account1.balance,
            )
          : null,
      account2: account2 != null
          ? AccountModel(
              id: account2.id,
              name: account2.name,
              balance: account2.balance,
            )
          : null,
      description: transaction.description,
      amount: transaction.amount,
      createdDateTime: DateTime.parse(transaction.createdDateTime),
    );
  }
}
