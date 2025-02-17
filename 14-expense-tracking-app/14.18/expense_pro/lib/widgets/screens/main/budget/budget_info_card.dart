import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '/utils/functions/format_double_string.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

class BudgetInfoCard extends StatelessWidget {
  const BudgetInfoCard({
    super.key,
    required this.category,
    required this.usedAmount,
    required this.estimatedAmount,
    required this.showAlert,
    required this.alertPercentage,
    required this.onTap,
  });

  final TransactionCategories category;
  final double usedAmount;
  final double estimatedAmount;
  final bool showAlert;
  final int alertPercentage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    bool hasPassedAlertPoint = showAlert
        ? ((usedAmount / estimatedAmount * 100) >= alertPercentage)
        : false;
    String remainingAmount =
        '${(estimatedAmount - usedAmount) >= 0 ? formatDoubleString(estimatedAmount - usedAmount) : 0}';
    double lineWidth = MediaQuery.of(context).size.width - 64;
    double coloredLineWidth = usedAmount * lineWidth / estimatedAmount;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 8,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(252, 252, 252, 1),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: const Color.fromRGBO(241, 241, 250, 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromRGBO(253, 60, 74, 1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        getTextForTransactionCategories(category),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(33, 35, 37, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                hasPassedAlertPoint
                    ? SvgPicture.asset('assets/icons/warning.svg')
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Remaining \$$remainingAmount',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(13, 14, 15, 1),
              ),
            ),
            const SizedBox(height: 4),
            Stack(
              children: [
                Container(
                  height: 12,
                  width: lineWidth,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 241, 250, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Container(
                  height: 12,
                  width: coloredLineWidth,
                  decoration: BoxDecoration(
                    color: hasPassedAlertPoint
                        ? const Color.fromRGBO(253, 60, 74, 1)
                        : const Color.fromRGBO(252, 172, 18, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              '\$${formatDoubleString(usedAmount)} of \$${formatDoubleString(estimatedAmount)}',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(145, 145, 159, 1),
              ),
            ),
            hasPassedAlertPoint
                ? Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'You’ve exceed the limit!',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(253, 60, 74, 1),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
