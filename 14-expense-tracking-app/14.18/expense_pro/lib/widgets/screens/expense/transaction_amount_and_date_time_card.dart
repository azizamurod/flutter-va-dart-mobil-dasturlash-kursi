import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/functions/format_double_string.dart';

class TransactionAmountAndDateTimeCard extends StatelessWidget {
  const TransactionAmountAndDateTimeCard({
    super.key,
    required this.color,
    required this.transactionAmount,
    required this.dateTime,
  });

  final Color color;
  final double transactionAmount;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            '\$${formatDoubleString(transactionAmount)}',
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
                'Saturday 4 June 2021',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '16:20',
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
