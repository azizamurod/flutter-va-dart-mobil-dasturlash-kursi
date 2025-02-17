import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_money.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/main/account/account_card.dart';

class AccountsListScreen extends StatelessWidget {
  const AccountsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AccountsProvider>().getDataForAccountsListScreen();
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.account_uppercase,
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Consumer<AccountsProvider>(
            builder: (context, accountsProvider, child) {
          return Column(
            children: [
              const SizedBox(height: 42),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/accounts_list_bg.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.account_balance,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(145, 145, 159, 1),
                        ),
                      ),
                      Text(
                        formatMoney(accountsProvider.accountsBalance, context),
                        style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(22, 23, 25, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  children: [
                    ...accountsProvider.accounts.map(
                      (el) {
                        return AccountCard(
                          name: el.name,
                          amount: el.balance,
                          onTap: () {
                            context
                                .read<AccountsProvider>()
                                .initializeAccountDetailScreen(el);
                            context
                                .read<TransactionsProvider>()
                                .getTransactionsForAccount(el.id);
                            Navigator.pushNamed(context, '/account-detail');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: '+ ${AppLocalizations.of(context)!.add_new_account}',
                margin: const EdgeInsets.all(16),
                onTap: () {
                  accountsProvider.resetCreateAccountScreen();
                  Navigator.pushNamed(
                    context,
                    '/create-account',
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
