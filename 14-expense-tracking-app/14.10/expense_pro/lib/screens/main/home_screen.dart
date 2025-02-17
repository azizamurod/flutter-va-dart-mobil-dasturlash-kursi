import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/widgets/switchers/month_and_year_switcher.dart';

import '/widgets/screens/main/bottom_nav_bar.dart';
import '/widgets/screens/main/home/add_transactions_section.dart';
import '/widgets/screens/main/home/home_transactions_section.dart';
import '/widgets/screens/main/home/spend_frequency_line_graph.dart';
import '/widgets/screens/main/home/account_balance_and_income_and_expense_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  Color appBarColor = const Color.fromRGBO(255, 246, 229, 1);
  bool isPlusTapped = false;

  @override
  void initState() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels > 293 &&
            appBarColor != Colors.white) {
          setState(() {
            appBarColor = Colors.white;
          });
        } else if (scrollController.position.pixels < 293 &&
            appBarColor != const Color.fromRGBO(255, 246, 229, 1)) {
          setState(() {
            appBarColor = const Color.fromRGBO(255, 246, 229, 1);
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView(
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
          ),
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
