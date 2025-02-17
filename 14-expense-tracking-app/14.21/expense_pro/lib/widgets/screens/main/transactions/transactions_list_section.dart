import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/drift/drift_db.dart';

import '/utils/functions/format_date_time.dart';
import '/utils/functions/string_to_transaction_types.dart';
import '/utils/functions/string_to_transaction_categories.dart';

import '/widgets/screens/main/transactions/transaction_card.dart';

class TransactionsListSection extends StatelessWidget {
  const TransactionsListSection({
    super.key,
    required this.transactions,
  });

  final Map<String, List<Transaction>> transactions;
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
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getTimeString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
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
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getTimeString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
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
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getDateString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
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
  });

  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ...transactions.map(
          (el) {
            return TransactionCard(
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getDateString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
