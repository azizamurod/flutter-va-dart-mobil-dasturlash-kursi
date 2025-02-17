import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/data/models/account_model.dart';

class TransactionModel {
  int? id;
  TransactionTypes? type;
  TransactionCategories? category;
  AccountModel? account;
  AccountModel? account2;
  String? description;
  double? amount;
  DateTime?createdDateTime;

  TransactionModel({
     this.id,
    this.type,
    this.category,
    this.account,
    this.account2,
    this.description,
    this.amount,
    this.createdDateTime,
  });
}
