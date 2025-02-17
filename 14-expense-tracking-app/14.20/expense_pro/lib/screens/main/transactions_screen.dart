import 'package:flutter/material.dart';

import '/widgets/switchers/month_and_year_switcher.dart';
import '/widgets/screens/main/transactions/filter_button.dart';
import '/widgets/screens/main/transactions/transactions_list_section.dart';
import '/widgets/bottom_sheets/show_filter_transactions_bottom_sheet.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MonthAndYearSwitcher(),
                FilterButton(
                  isFilterExist: true,
                  onTap: () {
                    showFilterTransactionsBottomSheet(
                      context: context,
                      reset: () => Navigator.pop(context),
                      apply: () => Navigator.pop(context),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SeeYourFinancialReportButton(),
            const SizedBox(height: 20),
            const TransactionsListSection(),
          ],
        ),
     
    );
  }
}
