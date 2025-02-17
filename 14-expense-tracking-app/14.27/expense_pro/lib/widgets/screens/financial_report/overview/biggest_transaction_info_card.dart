import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/utils/contants/transaction_categories.dart';

import 'transaction_category_card.dart';

class BiggestTransactionInfoCard extends StatelessWidget {
  const BiggestTransactionInfoCard({
    super.key,
    required this.transactionText,
    required this.category,
    required this.amount,
  });

  final String transactionText;
  final TransactionCategories category;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              AppLocalizations.of(context)!.biggest_transaction_text(transactionText,),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(13, 14, 15, 1),
              ),
            ),
          ),
          const SizedBox(height: 18),
          TransactionCategoryCard(category: category),
          const SizedBox(height: 10),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(13, 14, 15, 1),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
