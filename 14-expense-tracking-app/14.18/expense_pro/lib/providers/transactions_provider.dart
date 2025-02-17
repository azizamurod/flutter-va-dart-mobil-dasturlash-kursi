import 'package:expense_pro/data/drift/drift_db.dart';
import 'package:flutter/material.dart';

class TransactionsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  List<Transaction> _transactionsForAccount = [];

  List<Transaction> get transactionsForAccount => _transactionsForAccount;

  /// account detail
  void getTransactionsForAccount(int accountId) async {
    _transactionsForAccount = [];
    _transactionsForAccount = await driftDb.getTransactionsForAccount(
      accountId,
    );
    notifyListeners();
  }

  Map<String, List<Transaction>> separateTransactionsByDate(
    List<Transaction> transactions,
  ) {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    List<Transaction> todayTransactions = [];
    List<Transaction> yesterdayTransactions = [];
    List<Transaction> beforeTransactions = [];

    for (Transaction transaction in transactions) {
      DateTime transactionDateTime =
          DateTime.parse(transaction.createdDateTime);

      if (transactionDateTime.isAfter(todayStart)) {
        todayTransactions.add(transaction);
      } else if (transactionDateTime.isAfter(yesterdayStart) &&
          transactionDateTime.isBefore(todayStart)) {
        yesterdayTransactions.add(transaction);
      } else {
        beforeTransactions.add(transaction);
      }
    }

    return {
      'today': todayTransactions,
      'yesterday': yesterdayTransactions,
      'before': beforeTransactions,
    };
  }
}
