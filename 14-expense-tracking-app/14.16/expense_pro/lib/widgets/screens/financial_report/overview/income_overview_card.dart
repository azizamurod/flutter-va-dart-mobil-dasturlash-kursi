import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/financial_report/overview/this_month_text.dart';
import '/widgets/screens/financial_report/overview/biggest_transaction_info_card.dart';

class IncomeOverviewCard extends StatelessWidget {
  const IncomeOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ThisMonthText(),
        Column(
          children: [
            Text(
              'You Earned 💰',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "\$6000",
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const BiggestTransactionInfoCard(
          transactionText: 'Income',
          category: TransactionCategories.salary,
          amount: '5000',
        ),
      ],
    );
  }
}
