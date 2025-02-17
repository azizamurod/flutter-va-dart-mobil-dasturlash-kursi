import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '/utils/contants/transaction_types.dart';

import '/data/models/transaction_model.dart';

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

  Future<int> editAccount({
    required int id,
    required String name,
    required double balance,
  }) {
    return (update(accounts)..where((el) => el.id.equals(id))).write(
      AccountsCompanion(
        name: Value(name),
        balance: Value(balance),
      ),
    );
  }

  Future<int> deleteAccount(int id) {
    return (delete(accounts)..where((el) => el.id.equals(id))).go();
  }

  /// transactions
  Future<int> createTransaction(
    TransactionModel transaction,
  ) {
    return into(transactions).insert(
      TransactionsCompanion(
        type: Value(transaction.type.toString()),
        category: Value(transaction.category.toString()),
        accountId: Value(transaction.account?.id),
        accountId2: Value(transaction.account2?.id),
        description: Value(transaction.description ?? ''),
        amount: Value(transaction.amount ?? 0),
        createdDateTime: Value(
            (transaction.createdDateTime ?? DateTime.now()).toIso8601String()),
      ),
    );
  }

  Future<List<Transaction>> getTransactionsForAccount(int accountId) {
    return (select(transactions)
          ..where((el) {
            return el.accountId.equals(accountId) |
                el.accountId2.equals(accountId);
          }))
        .get();
  }

  Future<List<Transaction>> getAllExpense(DateTime month) {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 1).subtract(
      const Duration(seconds: 1),
    );

    return (select(transactions)
          ..where((el) => el.type.equals(TransactionTypes.expense.toString()))
          ..where((el) => el.createdDateTime.isBetweenValues(
              startOfMonth.toIso8601String(), endOfMonth.toIso8601String())))
        .get();
  }

  Future<List<Transaction>> getAllIncome(DateTime month) {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 1).subtract(
      const Duration(seconds: 1),
    );

    return (select(transactions)
          ..where((el) => el.type.equals(TransactionTypes.income.toString()))
          ..where((el) => el.createdDateTime.isBetweenValues(
              startOfMonth.toIso8601String(), endOfMonth.toIso8601String())))
        .get();
  }

  Future<void> deleteExpenses() async {
    (delete(transactions)
          ..where((el) => el.type.equals(TransactionTypes.expense.toString())))
        .go();
  }

  Future<List<Transaction>> getTransactionByTimeFrame(
    String timeFrame,
  ) async {
    final now = DateTime.now();
    late DateTime start;
    late DateTime end;

    switch (timeFrame) {
      case 'Today':
        start = DateTime(now.year, now.month, now.day);
        end = start
            .add(const Duration(days: 1))
            .subtract(const Duration(seconds: 1));
        break;

      case 'Week':
        start = now.subtract(Duration(days: now.weekday - 1));
        end = start
            .add(const Duration(days: 7))
            .subtract(const Duration(seconds: 1));
        break;

      case 'Month':
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 1)
            .subtract(const Duration(seconds: 1));
        break;
    }

    return (select(transactions)
          ..where((el) => el.createdDateTime.isBetweenValues(
                start.toIso8601String(),
                end.toIso8601String(),
              )))
        .get();
  }
}
