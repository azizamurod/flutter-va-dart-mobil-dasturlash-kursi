import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_money.dart';
import '/utils/contants/transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/bottom_sheets/show_remove_bottom_sheet.dart';
import '/widgets/screens/financial_report/overview/transaction_category_card.dart';

class BudgetDetailScreen extends StatelessWidget {
  const BudgetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BudgetsProvider>(
      builder: (context, budgetsProvider, _) {
        double usedAmount = budgetsProvider.detailBudget?.currentAmount ?? 0;
        double estimatedAmount =
            budgetsProvider.detailBudget?.estimatedAmount ?? 0;
        double remainingAmount =
            (estimatedAmount - usedAmount) >= 0 ? estimatedAmount - usedAmount : 0;
        double lineWidth = MediaQuery.of(context).size.width - 64;
        double coloredLineWidth = usedAmount * lineWidth / estimatedAmount;
        bool hasPassedAlertPoint =
            budgetsProvider.detailBudget?.receiveAlert == true
                ? ((usedAmount / estimatedAmount * 100) >=
                    (budgetsProvider.detailBudget?.alertPercentage ?? 0))
                : false;

        return Scaffold(
          appBar: CustomAppBar(
            title: 'Detail Budget',
            textColor: const Color.fromRGBO(13, 14, 15, 1),
            actions: [
              GestureDetector(
                onTap: () => showRemoveBottomSheet(
                  context: context,
                  text: 'budget',
                  remove: () => budgetsProvider.removeBudget(context),
                ),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(13, 14, 15, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 32),
                    TransactionCategoryCard(
                      category: budgetsProvider.detailBudget?.category ??
                          TransactionCategories.shopping,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Remaining',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(13, 14, 15, 1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatMoney(remainingAmount, context),
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(13, 14, 15, 1),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 32),
                    hasPassedAlertPoint
                        ? Container(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              left: 8,
                              right: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(253, 60, 74, 1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/warning.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'You’ve exceed the limit',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                CustomButton(
                  text: 'Edit',
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  onTap: () {
                    budgetsProvider.initEditBudgetScreen();
                    Navigator.pushNamed(context, '/edit-budget');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
