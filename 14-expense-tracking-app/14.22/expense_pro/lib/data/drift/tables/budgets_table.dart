import 'package:drift/drift.dart';

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
  RealColumn get estimatedAmount => real()();
  BoolColumn get receiveAlert => boolean()();
  IntColumn get alertPercentage => integer()();
  RealColumn get currentAmount => real()();
}
