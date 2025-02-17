import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/financial_report/overview/this_month_text.dart';
import '/widgets/screens/financial_report/overview/transaction_category_card.dart';

class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const ThisMonthText(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '2 of 12 Budget',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'exceeds the limit',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransactionCategoryCard(
                  category: TransactionCategories.shopping,
                ),
                SizedBox(width: 22),
                TransactionCategoryCard(
                  category: TransactionCategories.food,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
