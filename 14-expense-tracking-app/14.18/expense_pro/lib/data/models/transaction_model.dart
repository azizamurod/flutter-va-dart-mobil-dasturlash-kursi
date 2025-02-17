import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/data/models/account_model.dart';

class TransactionModel {
  final int? id;
  final TransactionTypes type;
  final TransactionCategories category;
  final AccountModel account;
  final AccountModel? account2;
  final String description;
  final double amount;
  final DateTime createdDateTime;

  TransactionModel({
     this.id,
    required this.type,
    required this.category,
    required this.account,
    this.account2,
    required this.description,
    required this.amount,
    required this.createdDateTime,
  });
}
