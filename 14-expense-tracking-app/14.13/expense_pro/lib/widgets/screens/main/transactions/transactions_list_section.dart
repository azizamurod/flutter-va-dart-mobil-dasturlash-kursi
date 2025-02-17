import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/screens/main/transactions/transaction_card.dart';

class TransactionsListSection extends StatelessWidget {
  const TransactionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(13, 14, 15, 1),
          ),
        ),
        const SizedBox(height: 12),
        ...[
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.shopping,
            'amount': 120,
            'description': 'Buy some grocery',
            'date_time': '10:00 AM',
          },
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.subscriptions,
            'amount': 80,
            'description': 'Books, Disney, Netflix, Telegram',
            'date_time': '3:30 PM',
          },
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.food,
            'amount': 25,
            'description': 'Buy a ramen',
            'date_time': '10:00 AM',
          },
        ].map(
          (el) {
            return TransactionCard(
              type: el["type"] as TransactionTypes,
              category: el["category"] as TransactionCategories,
              amount: el["amount"] as int,
              description: el["description"] as String,
              dateTime: el["date_time"] as String,
              onTap: () {},
            );
          },
        ),
        const SizedBox(height: 12),
        Text(
          'Yesterday',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(13, 14, 15, 1),
          ),
        ),
        const SizedBox(height: 12),
        ...[
          {
            'type': TransactionTypes.income,
            'category': TransactionCategories.salary,
            'amount': 1200,
            'description': 'Salary with some bonuses',
            'date_time': '10:00 AM',
          },
          {
            'type': TransactionTypes.transfer,
            'category': TransactionCategories.transfer,
            'amount': 120,
            'description': 'Buy some grocery',
            'date_time': '10:00 AM',
          },
        ].map(
          (el) {
            return TransactionCard(
              type: el["type"] as TransactionTypes,
              category: el["category"] as TransactionCategories,
              amount: el["amount"] as int,
              description: el["description"] as String,
              dateTime: el["date_time"] as String,
              onTap: () {},
            );
          },
        ),
        const SizedBox(height: 12),
        Text(
          'Before',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(13, 14, 15, 1),
          ),
        ),
        ...[
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.shopping,
            'amount': 120,
            'description': 'Buy some grocery',
            'date_time': '10:00 AM',
          },
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.subscriptions,
            'amount': 80,
            'description': 'Books, Disney, Netflix, Telegram',
            'date_time': '3:30 PM',
          },
          {
            'type': TransactionTypes.expense,
            'category': TransactionCategories.food,
            'amount': 25,
            'description': 'Buy a ramen',
            'date_time': '10:00 AM',
          },
          {
            'type': TransactionTypes.income,
            'category': TransactionCategories.salary,
            'amount': 1200,
            'description': 'Salary with some bonuses',
            'date_time': '10:00 AM',
          },
          {
            'type': TransactionTypes.transfer,
            'category': TransactionCategories.transfer,
            'amount': 120,
            'description': 'Buy some grocery',
            'date_time': '10:00 AM',
          },
        ].map(
          (el) {
            return TransactionCard(
              type: el["type"] as TransactionTypes,
              category: el["category"] as TransactionCategories,
              amount: el["amount"] as int,
              description: el["description"] as String,
              dateTime: el["date_time"] as String,
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
