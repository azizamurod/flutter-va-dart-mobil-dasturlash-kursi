import 'package:flutter/material.dart';

import '/widgets/switchers/month_and_year_switcher.dart';

import '/widgets/screens/main/home/home_transactions_section.dart';
import '/widgets/screens/main/home/spend_frequency_line_graph.dart';
import '/widgets/screens/main/home/account_balance_and_income_and_expense_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromRGBO(255, 246, 229, 1),
                Color.fromRGBO(254, 251, 247, 1),
              ],
            ),
          ),
          child: const Column(
            children: [
              MonthAndYearSwitcher(),
              SizedBox(height: 24),
              AccountBalanceAndIncomeAndExpenseSection(),
            ],
          ),
        ),
        const SizedBox(height: 14),
        const SpendFrequencyLineGraph(),
        const SizedBox(height: 24),
        const HomeTransactionsSection(),
      ],
    );
  }
}
