import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/models/transaction_model.dart';

import '/utils/functions/format_double_string.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/financial_report/overview/this_month_text.dart';
import '/widgets/screens/financial_report/overview/biggest_transaction_info_card.dart';

class ExpenseOverviewCard extends StatelessWidget {
  const ExpenseOverviewCard({
    super.key,
    required this.totalExpenseAmount,
    required this.biggestExpense,
  });

  final double totalExpenseAmount;
  final TransactionModel? biggestExpense;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ThisMonthText(),
        Column(
          children: [
            Text(
              'You Spend 💸',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "\$${formatDoubleString(totalExpenseAmount)}",
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
       biggestExpense != null ?  BiggestTransactionInfoCard(
          transactionText: 'spending',
          category:biggestExpense!.category ?? TransactionCategories.shopping,
          amount: formatDoubleString(biggestExpense!.amount??0),
        ): const SizedBox(),
      ],
    );
  }
}
