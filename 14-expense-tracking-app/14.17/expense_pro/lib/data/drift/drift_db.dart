import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/accounts_table.dart';
import 'tables/budgets_table.dart';
import 'tables/transactions_table.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [Accounts, Transactions, Budgets])
class DriftDb extends _$DriftDb {
  DriftDb._internal() : super(driftDatabase(name: 'expense_pro'));
  static final DriftDb _instance = DriftDb._internal();

  factory DriftDb() => _instance;

  @override
  int get schemaVersion => 1;

  /// accounts
  Future<List<Account>> getAllAccounts() => select(accounts).get();
  Future<int> createAccount({
    required String name,
    double? initialBalance,
  }) {
    return into(accounts).insert(
      AccountsCompanion(
        name: Value(name),
        balance: Value(initialBalance ?? 0),
      ),
    );
  }
}
