import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/functions/format_date_time.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/main/home/day_week_month_switcher.dart';
import '/widgets/screens/main/transactions/transaction_card.dart';

class HomeTransactionsSection extends StatelessWidget {
  const HomeTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transactionsProvider, _) {
        return transactionsProvider.hasTransactions
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    DayWeekMonthSwitcher(
                      transactionsProvider: transactionsProvider,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(41, 43, 45, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<UserAndNavigationManagementProvider>()
                              .changeActiveScreen(1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(238, 229, 255, 1),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              'See All',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(127, 51, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...transactionsProvider.recentTransactions.map(
                      (el) {
                        return TransactionCard(
                          type: el.type ?? TransactionTypes.expense,
                          category:
                              el.category ?? TransactionCategories.shopping,
                          amount: el.amount ?? 0,
                          description: el.description,
                          dateTime:
                              transactionsProvider.transactionsSwitcherValue ==
                                      'Today'
                                  ? getDateString(
                                      el.createdDateTime ?? DateTime.now())
                                  : getDateString(
                                      el.createdDateTime ?? DateTime.now()),
                          onTap: () {
                            transactionsProvider.goToTransactionDetailScreen(
                              context: context,
                              transaction: el,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
