import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/switchers/month_and_year_switcher.dart';
import '/widgets/screens/main/transactions/filter_button.dart';
import '/widgets/screens/main/transactions/transactions_list_section.dart';
import '/widgets/screens/main/transactions/see_your_financial_report_button.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MonthAndYearSwitcher(
                forTransactionsScreen: true,
              ),
              FilterButton(),
            ],
          ),
          const SizedBox(height: 20),
          const SeeYourFinancialReportButton(),
          const SizedBox(height: 20),
          Consumer<TransactionsProvider>(
            builder: (context, transactionsProvider, _) {
              return transactionsProvider.sorting == null
                  ? TransactionsListSection(
                      transactions:
                          transactionsProvider.separateTransactionsByDate(
                        transactionsProvider.transactions,
                      ),
                    )
                  : TransactionsListSectionWithoutDates(
                      transactions: transactionsProvider.transactions,
                    );
            },
          ),
        ],
      ),
    );
  }
}
