import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_double_string.dart';

class AccountBalanceAndIncomeAndExpenseSection extends StatelessWidget {
  const AccountBalanceAndIncomeAndExpenseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Account Balance",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(145, 145, 159, 1),
          ),
        ),
        const SizedBox(height: 9),
        Consumer<AccountsProvider>(
          builder: (context, accountsProvider, _) {
            return Text(
              "\$${formatDoubleString(accountsProvider.accountsBalance)}",
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(22, 23, 25, 1),
              ),
            );
          },
        ),
        const SizedBox(height: 27),
        Consumer<TransactionsProvider>(
          builder: (context, transactionsProvider, _) {
            return Row(
              children: [
                TransactionTypeInfoCard(
                  icon: 'assets/icons/income.svg',
                  color: const Color.fromRGBO(0, 168, 107, 1),
                  text: 'Income',
                  amount: formatDoubleString(transactionsProvider.incomeAmount),
                ),
                const SizedBox(width: 16),
                TransactionTypeInfoCard(
                  icon: 'assets/icons/expense.svg',
                  color: const Color.fromRGBO(253, 60, 74, 1),
                  text: 'Expense',
                  amount:
                      formatDoubleString(transactionsProvider.expenseAmount),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class TransactionTypeInfoCard extends StatelessWidget {
  const TransactionTypeInfoCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.amount,
  });

  final String icon;
  final Color color;
  final String text;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$$amount",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
