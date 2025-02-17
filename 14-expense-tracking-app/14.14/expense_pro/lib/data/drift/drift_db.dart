import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'tables/accounts_table.dart';
import 'tables/budgets_table.dart';
import 'tables/transactions_table.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [Accounts, Transactions, Budgets])
class DriftDb extends _$DriftDb {
  DriftDb() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}

