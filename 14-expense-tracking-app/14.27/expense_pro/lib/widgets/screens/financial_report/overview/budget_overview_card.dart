import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/data/models/budget_model.dart';

import '/widgets/screens/financial_report/overview/this_month_text.dart';
import '/widgets/screens/financial_report/overview/transaction_category_card.dart';

class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({
    super.key,
    required this.budgetsCount,
    required this.budgets,
  });

  final int budgetsCount;
  final List<BudgetModel> budgets;

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
              budgets.isEmpty
                  ? AppLocalizations.of(context)!.no_budget
                  : AppLocalizations.of(context)!.num_of_budgets(budgets.length, budgetsCount),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.exceeds_the_limit,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ...budgets.map(
                    (el) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: TransactionCategoryCard(
                          category: el.category!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
