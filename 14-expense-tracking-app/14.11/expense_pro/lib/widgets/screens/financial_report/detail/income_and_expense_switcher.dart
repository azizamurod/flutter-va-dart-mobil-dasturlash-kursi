import 'package:flutter/material.dart';

import '/utils/contants/transaction_types.dart';

import '/widgets/buttons/custom_button.dart';

class IncomeAndExpenseSwitcher extends StatelessWidget {
  const IncomeAndExpenseSwitcher({
    super.key,
    required this.type,
    required this.select,
  });

  final TransactionTypes type;
  final Function(TransactionTypes) select;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 241, 250, 1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Expense',
              height: 48,
              borderRadius: 32,
              color: type == TransactionTypes.expense
                  ? null
                  : const Color.fromRGBO(241, 241, 250, 1),
              textColor: type == TransactionTypes.expense ? null : Colors.black,
              onTap: () => select(TransactionTypes.expense),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Income',
              height: 48,
              borderRadius: 32,
              color: type == TransactionTypes.income
                  ? null
                  : const Color.fromRGBO(241, 241, 250, 1),
              textColor: type == TransactionTypes.income ? null : Colors.black,
              onTap: () => select(TransactionTypes.income),
            ),
          ),
        ],
      ),
    );
  }
}
