
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/widgets/bottom_sheets/select_month_and_year_bottom_sheet.dart';

class MonthAndYearSwitcher extends StatelessWidget {
  const MonthAndYearSwitcher({
    super.key,
    this.forTransactionsScreen = false,
  });

  final bool forTransactionsScreen;

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transactionsProvider, _) {
        return GestureDetector(
          onTap: () => showSelectMonthAndYearBottomSheet(
            context: context,
            selected: forTransactionsScreen
                ? transactionsProvider.selectedMonthForTransactions
                : transactionsProvider.selectedMonth,
            months: transactionsProvider.monthsFromSignup,
            onTap: (String val) {
              Navigator.pop(context);
              transactionsProvider.selectMonth(
                val,
                forTransactionsScreen: forTransactionsScreen,
              );
            },
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                bottom: 8,
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: const Color.fromRGBO(241, 241, 250, 1),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/arrow-down.svg'),
                  const SizedBox(width: 4),
                  Text(
                    forTransactionsScreen
                        ? transactionsProvider.selectedMonthForTransactions
                        : transactionsProvider.selectedMonth,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(33, 35, 37, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
