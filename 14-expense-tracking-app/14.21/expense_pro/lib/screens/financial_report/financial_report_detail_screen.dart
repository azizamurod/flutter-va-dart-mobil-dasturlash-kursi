import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Financial Report',
        backgroundColor: Colors.white,
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      MonthSwitcher(),
                      SizedBox(width: 12),
                      YearSwitcher(),
                    ],
                  ),
                  Row(
                    children: [
                      LineAndGraphSwitcher(
                        icon: 'assets/icons/line-chart.svg',
                        isActive: true,
                        isLeftSide: true,
                        onTap: () {},
                      ),
                      LineAndGraphSwitcher(
                        icon: 'assets/icons/pie-chart.svg',
                        isActive: false,
                        isLeftSide: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const FinancialReportChartsSection(isLineGraph: true),
            const SizedBox(height: 40),
            const FinancialReportChartsSection(isLineGraph: false),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  IncomeAndExpenseSwitcher(
                    type: TransactionTypes.expense,
                    select: (TransactionTypes type) {},
                  ),
                  const SizedBox(height: 20),
                  const CategorySwitcher(),
                  const SizedBox(height: 16),
                  ...[
                    {
                      'type': TransactionTypes.expense,
                      'category': TransactionCategories.shopping,
                      'amount': 120,
                      'description': 'Buy some grocery',
                      'date_time': '10:00 AM',
                    },
                    {
                      'type': TransactionTypes.expense,
                      'category': TransactionCategories.subscriptions,
                      'amount': 80,
                      'description': 'Books, Disney, Netflix, Telegram',
                      'date_time': '3:30 PM',
                    },
                    {
                      'type': TransactionTypes.expense,
                      'category': TransactionCategories.food,
                      'amount': 25,
                      'description': 'Buy a ramen',
                      'date_time': '10:00 AM',
                    },
                  ].map(
                    (el) {
                      return TransactionCard(
                        type: el["type"] as TransactionTypes,
                        category: el["category"] as TransactionCategories,
                        amount: (el["amount"] as int).toDouble(),
                        description: el["description"] as String,
                        dateTime: el["date_time"] as String,
                        onTap: () {},
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ...[
                    {
                      'category': TransactionCategories.shopping,
                      'amount': 120.0,
                      'color': Colors.orange,
                    },
                    {
                      'category': TransactionCategories.subscriptions,
                      'amount': 80.0,
                      'color': Colors.purple,
                    },
                    {
                      'category': TransactionCategories.food,
                      'amount': 32.0,
                      'color': Colors.red,
                    },
                  ].map((el) {
                    return TransactionCategoryOverviewInfoCard(
                      type: TransactionTypes.expense,
                      category: el['category'] as TransactionCategories,
                      amount: el['amount'] as double,
                      totalAmount: 332,
                      color: el['color'] as Color,
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
