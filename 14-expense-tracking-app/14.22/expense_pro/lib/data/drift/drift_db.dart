import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '/utils/contants/sorting_types.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

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

  Future<List<TransactionModel>> getTransactionsForAccount(
    int accountId,
  ) async {
    final accounts1 = alias(accounts, 'first_account');
    final accounts2 = alias(accounts, 'second_account');

    final query = await (select(transactions)
          ..where((el) {
            return el.accountId.equals(accountId) |
                el.accountId2.equals(accountId);
          }))
        .join([
      leftOuterJoin(accounts1, accounts1.id.equalsExp(transactions.accountId)),
      leftOuterJoin(accounts2, accounts2.id.equalsExp(transactions.accountId2)),
    ]).get();

    return query.map((row) {
      return TransactionModel.fromRow(
        transaction: row.readTable(transactions),
        account1: row.readTableOrNull(accounts1),
        account2: row.readTableOrNull(accounts2),
      );
    }).toList();
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

  Future<List<TransactionModel>> getTransactionsByTimeFrame(
    String timeFrame, {
    DateTime? dateTime,
    TransactionTypes? type,
    SortingTypes? sorting,
    List<TransactionCategories?>? categories,
  }) async {
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
        start = DateTime(
          dateTime?.year ?? now.year,
          dateTime?.month ?? now.month,
          1,
        );
        end = DateTime(
          dateTime?.year ?? now.year,
          (dateTime?.month ?? now.month) + 1,
          1,
        ).subtract(const Duration(seconds: 1));
        break;
    }

    final query = (select(transactions)
      ..where((el) => el.createdDateTime.isBetweenValues(
            start.toIso8601String(),
            end.toIso8601String(),
          )));

    if (type != null) {
      query.where((el) => el.type.equals(type.toString()));
    }

    if (categories != null && categories.isNotEmpty) {
      query.where(
        (el) => el.category.isIn(categories.map((c) => c.toString())),
      );
    }

    switch (sorting) {
      case SortingTypes.highest:
        query.orderBy([(t) => OrderingTerm.desc(t.amount)]);
        break;

      case SortingTypes.lowest:
        query.orderBy([(t) => OrderingTerm.asc(t.amount)]);
        break;

      case SortingTypes.newest:
        query.orderBy([(t) => OrderingTerm.desc(t.createdDateTime)]);
        break;

      case SortingTypes.oldest:
        query.orderBy([(t) => OrderingTerm.asc(t.createdDateTime)]);
        break;

      case null:
        break;
    }

    final accounts1 = alias(accounts, 'first_account');
    final accounts2 = alias(accounts, 'second_account');

    final joinedQuery = await query.join([
      leftOuterJoin(accounts1, accounts1.id.equalsExp(transactions.accountId)),
      leftOuterJoin(accounts2, accounts2.id.equalsExp(transactions.accountId2)),
    ]).get();

    return joinedQuery.map((row) {
      return TransactionModel.fromRow(
        transaction: row.readTable(transactions),
        account1: row.readTableOrNull(accounts1),
        account2: row.readTableOrNull(accounts2),
      );
    }).toList();
  }

  Future<int> deleteTransaction(int id) {
    return (delete(transactions)..where((el) => el.id.equals(id))).go();
  }
}
