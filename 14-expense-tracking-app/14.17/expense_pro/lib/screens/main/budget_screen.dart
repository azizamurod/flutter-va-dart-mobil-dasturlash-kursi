import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/screens/main/bottom_nav_bar.dart';
import '/widgets/screens/main/budget/budget_info_card.dart';
import '/widgets/screens/main/home/add_transactions_section.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  bool isPlusTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ...[
                        {
                          'category': TransactionCategories.shopping,
                          'used_amount': 1200.0,
                          'estimated_amount': 1000.0,
                          'show_alert': true,
                          'alert_percentage': 80,
                        },
                        {
                          'category': TransactionCategories.transportation,
                          'used_amount': 350.0,
                          'estimated_amount': 700.0,
                          'show_alert': true,
                          'alert_percentage': 80,
                        },
                        {
                          'category': TransactionCategories.shopping,
                          'used_amount': 1200.0,
                          'estimated_amount': 1000.0,
                          'show_alert': false,
                          'alert_percentage': 80,
                        },
                        {
                          'category': TransactionCategories.shopping,
                          'used_amount': 800.0,
                          'estimated_amount': 1000.0,
                          'show_alert': false,
                          'alert_percentage': 80,
                        },
                        {
                          'category': TransactionCategories.shopping,
                          'used_amount': 800.0,
                          'estimated_amount': 1000.0,
                          'show_alert': true,
                          'alert_percentage': 80,
                        },
                      ].map((el) {
                        return BudgetInfoCard(
                          category: el['category'] as TransactionCategories,
                          usedAmount: el['used_amount'] as double,
                          estimatedAmount: el['estimated_amount'] as double,
                          showAlert: el['show_alert'] as bool,
                          alertPercentage: el['alert_percentage'] as int,
                          onTap: () {
                            Navigator.pushNamed(context, '/budget-detail');
                          },
                        );
                      })
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Create a budget',
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 25,
                    bottom: 40,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          // const EmptyBudgetText(),
          isPlusTapped
              ? AddTransactionsSection(
                  close: () {
                    setState(() {
                      isPlusTapped = false;
                    });
                  },
                )
              : const SizedBox(),
        ],
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
