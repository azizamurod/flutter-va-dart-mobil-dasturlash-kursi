import 'package:flutter/material.dart';

import 'add_transaction_buttons.dart';

class AddTransactionsSection extends StatelessWidget {
  const AddTransactionsSection({
    super.key,
    required this.close,
  });

  final Function close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => close(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(139, 80, 255, 0),
              Color.fromRGBO(139, 80, 255, 0.24),
            ],
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AddTransferButton(),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddIncomeButton(),
                SizedBox(width: 80),
                AddExpenseButton(),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
