import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/models/transaction_model.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/functions/format_date_time.dart';
import '/utils/functions/format_double_string.dart';

class TransactionAmountAndDateTimeCard extends StatelessWidget {
  const TransactionAmountAndDateTimeCard({
    super.key,
    required this.transaction,
  });

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: transaction.type == TransactionTypes.expense
            ? const Color.fromRGBO(253, 60, 74, 1)
            : (transaction.type == TransactionTypes.income
                ? const Color.fromRGBO(0, 168, 107, 1)
                : const Color.fromRGBO(0, 119, 255, 1)),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            '\$${formatDoubleString(transaction.amount ?? 0)}',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getDateStringForTransactionDetailScreen(
                  transaction.createdDateTime ?? DateTime.now(),
                ),
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                getTimeString(
                  transaction.createdDateTime ?? DateTime.now(),
                ),
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 78),
        ],
      ),
    );
  }
}
