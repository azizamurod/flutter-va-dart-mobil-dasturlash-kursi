import 'package:drift/drift.dart';

import 'accounts_table.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  @ReferenceName('first_account')
  IntColumn get accountId =>
      integer().nullable().customConstraint('REFERENCES accounts(id)')();
  @ReferenceName('second_account')
  IntColumn get accountId2 =>
      integer().nullable().customConstraint('REFERENCES accounts(id)')();
  TextColumn get type => text()();
  TextColumn get category => text()();
  TextColumn get description => text()();
  RealColumn get amount => real()();
  TextColumn get createdDateTime => text()();
}
