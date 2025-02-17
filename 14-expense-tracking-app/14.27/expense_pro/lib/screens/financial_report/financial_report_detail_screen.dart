import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_date_time.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/switchers/year_switcher.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/switchers/month_switcher.dart';
import '/widgets/switchers/category_switcher.dart';
import '/widgets/switchers/line_and_graph_switcher.dart';

import '/widgets/screens/main/transactions/transaction_card.dart';
import '/widgets/screens/financial_report/detail/income_and_expense_switcher.dart';
import '/widgets/screens/financial_report/detail/financial_report_charts_section.dart';
import '/widgets/screens/main/transactions/transaction_category_overview_info_card.dart';

class FinancialReportDetailScreen extends StatelessWidget {
  const FinancialReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ReportsProvider>().initializeDetailScreen(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.financial_report,
        backgroundColor: Colors.white,
        textColor: const Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Consumer<ReportsProvider>(
          builder: (context, reportsProvider, _) {
            return ListView(
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MonthSwitcher(
                            months: reportsProvider.months,
                            selectedMonth: reportsProvider.selectedMonth,
                            selectMonth: reportsProvider.selectMonth,
                          ),
                          const SizedBox(width: 12),
                          YearSwitcher(
                            years: reportsProvider.years,
                            selectedYear: reportsProvider.selectedYear,
                            selectYear: reportsProvider.selectYear,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          LineAndGraphSwitcher(
                            icon: 'assets/icons/line-chart.svg',
                            isActive: reportsProvider.isLineGraph,
                            isLeftSide: true,
                            onTap: () =>
                                reportsProvider.changeIsLineGraph(true),
                          ),
                          LineAndGraphSwitcher(
                            icon: 'assets/icons/pie-chart.svg',
                            isActive: !reportsProvider.isLineGraph,
                            isLeftSide: false,
                            onTap: () =>
                                reportsProvider.changeIsLineGraph(false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FinancialReportChartsSection(
                  reportsProvider: reportsProvider,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      IncomeAndExpenseSwitcher(
                        type: reportsProvider.transactionType,
                        select: reportsProvider.changeTransactionType,
                      ),
                      const SizedBox(height: 20),
                      CategorySwitcher(reportsProvider: reportsProvider),
                      const SizedBox(height: 16),
                      reportsProvider.isLineGraph
                          ? Column(
                              children: [
                                ...(reportsProvider.transactionType ==
                                            TransactionTypes.expense
                                        ? reportsProvider.expenses
                                        : reportsProvider.incomes)
                                    .map(
                                  (el) {
                                    return TransactionCard(
                                      type: el.type ?? TransactionTypes.expense,
                                      category: el.category ??
                                          TransactionCategories.shopping,
                                      amount: el.amount ?? 0,
                                      description: el.description,
                                      dateTime: getDateString(
                                        el.createdDateTime ?? DateTime.now(),
                                      ),
                                      onTap: () {
                                        context
                                            .read<TransactionsProvider>()
                                            .goToTransactionDetailScreen(
                                              context: context,
                                              transaction: el,
                                            );
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                ...(reportsProvider.transactionType ==
                                            TransactionTypes.expense
                                        ? reportsProvider.categorizedExpenses
                                        : reportsProvider.categorizedIncomes)
                                    .map(
                                  (el) {
                                    return TransactionCategoryOverviewInfoCard(
                                      type: reportsProvider.transactionType,
                                      category: el['category'],
                                      amount: el['amount'],
                                      totalAmount:
                                          reportsProvider.transactionType ==
                                                  TransactionTypes.expense
                                              ? reportsProvider.allExpenseAmount
                                              : reportsProvider.allIncomeAmount,
                                      color: el['color'],
                                    );
                                  },
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
