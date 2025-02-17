import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/data/drift/drift_db.dart';
import '/providers/.providers.dart';

import '/utils/contants/transaction_types.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';
import '/widgets/text_fields/select_card_without_arrow_down.dart';
import '/widgets/bottom_sheets/show_select_accounts_bottom_sheet.dart';

class CreateTransferScreen extends StatelessWidget {
  const CreateTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<TransactionsProvider>()
        .initializeCreateScreen(TransactionTypes.transfer);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 119, 255, 1),
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.transfer,),
      body: Consumer<TransactionsProvider>(
        builder: (context, transactionsProvider, _) {
          return Column(
            children: [
              const SizedBox(height: 206),
              TransactionAmountTextField(
              text: AppLocalizations.of(context)!.how_much,
                controller: transactionsProvider.amountController,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
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
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  SelectCardWithoutArrowDown(
                                    text: AppLocalizations.of(context)!.from,
                                    isSelected: transactionsProvider
                                            .transactionForCreation?.account !=
                                        null,
                                    selectedText: transactionsProvider
                                        .transactionForCreation?.account?.name,
                                    onTap: () => showSelectAccountsBottomSheet(
                                      context: context,
                                      selected: transactionsProvider
                                          .transactionForCreation?.account,
                                      excludeSelected: true,
                                      excludedAccount: transactionsProvider
                                          .transactionForCreation?.account2,
                                      select: (Account el) {
                                        transactionsProvider.selectAccount(el);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  SelectCardWithoutArrowDown(
                                    text: AppLocalizations.of(context)!.to,
                                    isSelected: transactionsProvider
                                            .transactionForCreation?.account2 !=
                                        null,
                                    selectedText: transactionsProvider
                                        .transactionForCreation?.account2?.name,
                                    onTap: () => showSelectAccountsBottomSheet(
                                      context: context,
                                      selected: transactionsProvider
                                          .transactionForCreation?.account2,
                                      excludeSelected: true,
                                      excludedAccount: transactionsProvider
                                          .transactionForCreation?.account,
                                      select: (Account el) {
                                        transactionsProvider.selectAccount(
                                          el,
                                          secondAccount: true,
                                        );
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(241, 241, 250, 1),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/transaction.svg',
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            hintText: AppLocalizations.of(context)!.description,
                            controller: TextEditingController(),
                          ),
                        ],
                      ),
                      CustomButton(
                        text: AppLocalizations.of(context)!.continue_text,
                        margin: const EdgeInsets.only(bottom: 32),
                        onTap: () => transactionsProvider.createTransaction(
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
