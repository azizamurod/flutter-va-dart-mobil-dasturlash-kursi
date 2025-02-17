import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/functions/format_money.dart';
import '/utils/contants/transaction_types.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_icon_for_transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.type,
    required this.category,
    required this.amount,
    required this.description,
    required this.dateTime,
    required this.onTap,
  });

  final TransactionTypes type;
  final TransactionCategories category;
  final double amount;
  final String description;
  final String dateTime;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromRGBO(252, 252, 252, 1),
        ),
        child: Row(
          children: [
            Image.asset(
              getIconForTransactionCategories(category),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTextForTransactionCategories(category),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(41, 43, 45, 1),
                          ),
                        ),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(145, 145, 159, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      type == TransactionTypes.expense
                          ? Text(
                              "-${formatMoney(amount, context)}",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(253, 60, 74, 1),
                              ),
                            )
                          : (type == TransactionTypes.income
                              ? Text(
                                  "+${formatMoney(amount, context)}",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 168, 174, 1),
                                  ),
                                )
                              : Text(
                                  formatMoney(amount, context),
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 119, 255, 1),
                                  ),
                                )),
                      Text(
                        dateTime,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(145, 145, 159, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
