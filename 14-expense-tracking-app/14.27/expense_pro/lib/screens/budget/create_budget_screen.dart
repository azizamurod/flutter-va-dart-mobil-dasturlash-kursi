import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/contants/transaction_categories.dart';
import '/utils/functions/get_text_for_transaction_categories.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/select_card.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';
import '/widgets/bottom_sheets/show_select_transaction_categories_bottom_sheet.dart';

class CreateBudgetScreen extends StatelessWidget {
  const CreateBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.create_budget,
      ),
      body: Consumer<BudgetsProvider>(
        builder: (context, budgetsProvider, _) {
          return Column(
            children: [
              const Expanded(child: SizedBox()),
              TransactionAmountTextField(
                text:
                    AppLocalizations.of(context)!.how_much_do_you_want_to_spend,
                controller: budgetsProvider.budgetAmountController,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SelectCard(
                          text: AppLocalizations.of(context)!.category,
                          selectedText: getTextForTransactionCategories(
                            budgetsProvider.budgetForCreation.category,
                            context,
                          ),
                          isSelected:
                              budgetsProvider.budgetForCreation.category !=
                                  null,
                          onTap: () =>
                              showSelectTransactionCategoriesBottomSheet(
                            context: context,
                            categories: budgetsProvider.categories,
                            selected: [
                              budgetsProvider.budgetForCreation.category
                            ],
                            select: (TransactionCategories el) {
                              Navigator.pop(context);
                              budgetsProvider.selectCategory(el);
                            },
                          ),
                        ),
                        const SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.receive_alert,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(41, 43, 45, 1),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  AppLocalizations.of(context)!
                                      .receive_alert_when_text,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(145, 145, 159, 1),
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: budgetsProvider
                                      .budgetForCreation.receiveAlert ??
                                  false,
                              onChanged: (_) {
                                budgetsProvider.toggleReceiveAlert();
                              },
                              inactiveTrackColor:
                                  const Color.fromRGBO(238, 229, 255, 1),
                              inactiveThumbColor: Colors.white,
                              activeTrackColor:
                                  const Color.fromRGBO(127, 61, 255, 1),
                              trackOutlineColor:
                                  WidgetStateProperty.resolveWith(
                                (_) {
                                  return Colors.white;
                                },
                              ),
                            ),
                          ],
                        ),
                        budgetsProvider.budgetForCreation.receiveAlert == true
                            ? Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 12,
                                  ),
                                  child: Slider(
                                    value: budgetsProvider
                                            .budgetForCreation.alertPercentage
                                            ?.toDouble() ??
                                        0,
                                    min: 0,
                                    max: 100,
                                    divisions: 10,
                                    label:
                                        '${budgetsProvider.budgetForCreation.alertPercentage}%',
                                    activeColor:
                                        const Color.fromRGBO(127, 61, 255, 1),
                                    inactiveColor:
                                        const Color.fromRGBO(227, 229, 229, 1),
                                    thumbColor:
                                        const Color.fromRGBO(127, 61, 255, 1),
                                    onChanged: (double value) {
                                      budgetsProvider
                                          .setReceiveAlertPercentage(value);
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    CustomButton(
                      text: AppLocalizations.of(context)!.continue_text,
                      margin: const EdgeInsets.only(bottom: 32, top: 40),
                      onTap: () => budgetsProvider.createBudget(context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
