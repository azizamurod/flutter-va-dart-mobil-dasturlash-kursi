import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/data/models/transaction_model.dart';

import '/utils/functions/format_money.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/financial_report/overview/this_month_text.dart';
import '/widgets/screens/financial_report/overview/biggest_transaction_info_card.dart';

class IncomeOverviewCard extends StatelessWidget {
  const IncomeOverviewCard({
    super.key,
    required this.totalIncomeAmount,
    required this.biggestIncome,
  });

  final double totalIncomeAmount;
  final TransactionModel? biggestIncome;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ThisMonthText(),
        Column(
          children: [
            Text(
              '${AppLocalizations.of(context)!.you_earned} 💰',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              formatMoney(totalIncomeAmount, context),
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        biggestIncome != null
            ? BiggestTransactionInfoCard(
                transactionText: AppLocalizations.of(context)!.income.toLowerCase(),
                category:
                    biggestIncome!.category ?? TransactionCategories.salary,
                amount: formatMoney(biggestIncome!.amount ?? 0, context),
              )
            : const SizedBox(),
      ],
    );
  }
}
