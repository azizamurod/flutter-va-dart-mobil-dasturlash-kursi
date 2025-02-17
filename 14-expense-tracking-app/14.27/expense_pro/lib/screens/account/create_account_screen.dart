import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/text_fields/custom_text_field.dart';
import '/widgets/text_fields/transaction_amount_text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool? isInitialScreen =
        ModalRoute.of(context)!.settings.arguments as bool?;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.add_new_account,
      ),
      body: Consumer<AccountsProvider>(
          builder: (context, accountsProvider, child) {
        return Column(
          children: [
            const SizedBox(height: 206),
            TransactionAmountTextField(
              text: AppLocalizations.of(context)!.balance,
              controller: accountsProvider.accountBalanceController,
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
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.name,
                      controller: accountsProvider.accountNameController,
                    ),
                    CustomButton(
                      text: AppLocalizations.of(context)!.continue_text,
                      margin: const EdgeInsets.only(bottom: 32),
                      onTap: () => accountsProvider.createAccount(
                        context,
                        isInitialScreen: isInitialScreen ?? false,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
