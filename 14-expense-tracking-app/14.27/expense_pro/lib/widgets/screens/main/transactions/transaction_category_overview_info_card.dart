import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/functions/format_money.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

class TransactionCategoryOverviewInfoCard extends StatelessWidget {
  const TransactionCategoryOverviewInfoCard({
    super.key,
    required this.type,
    required this.category,
    required this.amount,
    required this.totalAmount,
    required this.color,
  });

  final TransactionTypes type;
  final TransactionCategories category;
  final double amount;
  final double totalAmount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TransactionCategoryCard(
                category: category,
                color: color,
              ),
              type == TransactionTypes.expense
                  ? Text(
                      '-${formatMoney(amount, context)}',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(253, 60, 74, 1),
                      ),
                    )
                  : Text(
                      '+${formatMoney(amount, context)}',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 168, 107, 1),
                      ),
                    ),
            ],
          ),
          const SizedBox(),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 241, 250, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                height: 8,
                width: amount * width / totalAmount,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionCategoryCard extends StatelessWidget {
  const TransactionCategoryCard({
    super.key,
    required this.category,
    required this.color,
  });

  final TransactionCategories category;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(252, 252, 252, 1),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color.fromRGBO(241, 241, 250, 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            getTextForTransactionCategories(category, context),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(33, 35, 37, 1),
            ),
          ),
        ],
      ),
    );
  }
}
