import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/drift/drift_db.dart';

import '/utils/functions/format_date_time.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/string_to_transaction_types.dart';
import '/utils/functions/string_to_transaction_categories.dart';

import '/widgets/screens/main/transactions/transaction_card.dart';

class RealTransactionsListSection extends StatelessWidget {
  const RealTransactionsListSection({
    super.key,
    required this.transactions,
  });

  final Map<String, List<Transaction>> transactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        transactions['today']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Today',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['today']!.map(
          (el) {
            return TransactionCard(
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getTimeString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
            );
          },
        ),
        const SizedBox(height: 12),
        transactions['yesterday']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Yesterday',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['yesterday']!.map(
          (el) {
            return TransactionCard(
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getTimeString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
            );
          },
        ),
        const SizedBox(height: 12),
        transactions['before']!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Before',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 14, 15, 1),
                  ),
                ),
              )
            : const SizedBox(),
        ...transactions['before']!.map(
          (el) {
            return TransactionCard(
              type: stringToTransactionTypes(el.type),
              category: stringToTransactionCategories(el.category),
              amount: el.amount,
              description: el.description,
              dateTime: getDateString(DateTime.parse(el.createdDateTime)),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}

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
              amount: (el["amount"] as int).toDouble(),
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
              amount: (el["amount"] as int).toDouble(),
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
              amount: (el["amount"] as int).toDouble(),
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
