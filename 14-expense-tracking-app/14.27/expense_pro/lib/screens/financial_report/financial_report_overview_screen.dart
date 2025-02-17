import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story/story_page_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/widgets/buttons/custom_button.dart';

import '/widgets/screens/financial_report/overview/quote_card.dart';
import '/widgets/screens/financial_report/overview/income_overview_card.dart';
import '/widgets/screens/financial_report/overview/budget_overview_card.dart';
import '/widgets/screens/financial_report/overview/expense_overview_card.dart';

class FinancialReportOverviewScreen extends StatelessWidget {
  const FinancialReportOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ReportsProvider>().getDataForOverviewScreen();
    return Consumer<ReportsProvider>(
      builder: (context, reportsProvider, _) {
        return Scaffold(
          backgroundColor: reportsProvider.overviewScreenBgColor,
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                StoryPageView(
                  itemBuilder: (context, pageIndex, storyIndex) {
                    Future.delayed(
                      const Duration(seconds: 0),
                      () {
                        reportsProvider.changeOverviewScreenBgColor(storyIndex);
                      },
                    );
                    return Container(
                      color: reportsProvider.overviewScreenBgColor,
                      child: storyIndex == 0
                          ? ExpenseOverviewCard(
                              totalExpenseAmount:
                                  reportsProvider.totalExpenseAmount,
                              biggestExpense: reportsProvider.biggestExpense,
                            )
                          : (storyIndex == 1
                              ? IncomeOverviewCard(
                                  totalIncomeAmount:
                                      reportsProvider.totalIncomeAmount,
                                  biggestIncome: reportsProvider.biggestIncome,
                                )
                              : (storyIndex == 2
                                  ? (reportsProvider.storyLength == 3
                                      ? const QuoteCard()
                                      : BudgetOverviewCard(
                                          budgetsCount:
                                              reportsProvider.allBudgetsCount,
                                          budgets: reportsProvider
                                              .budgetsExeedingLimit,
                                        ))
                                  : const QuoteCard())),
                    );
                  },
                  gestureItemBuilder: (context, pageIndex, storyIndex) {
                    return Stack(children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ]);
                  },
                  indicatorAnimationController:
                      reportsProvider.indicatorAnimationController,
                  initialStoryIndex: (pageIndex) {
                    return 0;
                  },
                  pageLength: 1,
                  storyLength: (_) => reportsProvider.storyLength,
                  indicatorHeight: 4,
                  indicatorVisitedColor: Colors.white,
                  indicatorUnvisitedColor: Colors.white.withOpacity(0.24),
                  indicatorPadding: const EdgeInsets.symmetric(
                    vertical: 19,
                    horizontal: 14,
                  ),
                ),
                ((reportsProvider.storyLength == 3 &&
                            reportsProvider.storyIndex == 2) ||
                        reportsProvider.storyIndex == 3)
                    ? CustomButton(
                        text: AppLocalizations.of(context)!.see_the_full_detail,
                        color: Colors.white,
                        textColor: const Color.fromRGBO(127, 61, 255, 1),
                        margin: const EdgeInsets.all(16),
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/financial-report-detail',
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
