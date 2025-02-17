import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_icon_for_transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

class TransactionCategoryCard extends StatelessWidget {
  const TransactionCategoryCard({
    super.key,
    required this.category,
  });

  final TransactionCategories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(252, 252, 252, 1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color.fromRGBO(227, 229, 229, 1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            getIconForTransactionCategories(category),
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 8),
          Text(
            getTextForTransactionCategories(category),
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
        ],
      ),
    );
  }
}
