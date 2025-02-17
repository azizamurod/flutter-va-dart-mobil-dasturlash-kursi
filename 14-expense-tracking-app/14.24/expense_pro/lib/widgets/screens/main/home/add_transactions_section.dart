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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AddTransferButton(close: close),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddIncomeButton(close: close),
               const  SizedBox(width: 80),
                AddExpenseButton(close: close),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
