import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/data/models/transaction_model.dart';

import '/utils/functions/format_date_time.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/contants/transaction_types.dart';

import '/widgets/screens/main/transactions/transaction_card.dart';

class TransactionsListSection extends StatelessWidget {
  const TransactionsListSection({
    super.key,
    required this.transactions,
    required this.transactionsProvider,
  });

  final Map<String, List<TransactionModel>> transactions;
  final TransactionsProvider transactionsProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        transactions['today']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Today',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['today']!.map(
          (el) {
            return TransactionCard(
              type: el.type ?? TransactionTypes.expense,
              category: el.category ?? TransactionCategories.shopping,
              amount: el.amount ?? 0,
              description: el.description,
              dateTime: getTimeString(
                el.createdDateTime ?? DateTime.now(),
              ),
              onTap: () {
                transactionsProvider.goToTransactionDetailScreen(
                  context: context,
                  transaction: el,
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
        transactions['yesterday']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Yesterday',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['yesterday']!.map(
          (el) {
            return TransactionCard(
              type: el.type ?? TransactionTypes.expense,
              category: el.category ?? TransactionCategories.shopping,
              amount: el.amount ?? 0,
              description: el.description,
              dateTime: getTimeString(
                el.createdDateTime ?? DateTime.now(),
              ),
              onTap: () {
                transactionsProvider.goToTransactionDetailScreen(
                  context: context,
                  transaction: el,
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
        transactions['before']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Before',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['before']!.map(
          (el) {
            return TransactionCard(
              type: el.type ?? TransactionTypes.expense,
              category: el.category ?? TransactionCategories.shopping,
              amount: el.amount ?? 0,
              description: el.description,
              dateTime: getDateString(
                el.createdDateTime ?? DateTime.now(),
              ),
              onTap: () {
                transactionsProvider.goToTransactionDetailScreen(
                  context: context,
                  transaction: el,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class TransactionsListSectionWithoutDates extends StatelessWidget {
  const TransactionsListSectionWithoutDates({
    super.key,
    required this.transactions,
    required this.transactionsProvider,
  });

  final List<TransactionModel> transactions;
  final TransactionsProvider transactionsProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...transactions.map(
          (el) {
            return TransactionCard(
              type: el.type ?? TransactionTypes.expense,
              category: el.category ?? TransactionCategories.shopping,
              amount: el.amount ?? 0,
              description: el.description,
              dateTime: getDateString(
                el.createdDateTime ?? DateTime.now(),
              ),
              onTap: () {
                transactionsProvider.goToTransactionDetailScreen(
                  context: context,
                  transaction: el,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
