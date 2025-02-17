import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/widgets/screens/main/bottom_nav_bar.dart';
import '/widgets/switchers/month_and_year_switcher.dart';
import '/widgets/screens/main/transactions/filter_button.dart';
import '/widgets/screens/main/transactions/transactions_list_section.dart';
import '/widgets/bottom_sheets/show_filter_transactions_bottom_sheet.dart';
import '/widgets/screens/main/transactions/see_your_financial_report_button.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  bool isPlusTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                isPlusTapped = !isPlusTapped;
              });
            },
            backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
            shape: const CircleBorder(),
            elevation: 0,
            child: Transform.rotate(
              angle: isPlusTapped ? 90 : 0,
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
