import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_money.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/main/transactions/transactions_list_section.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.detail_account,
        textColor: const Color.fromRGBO(33, 35, 37, 1),
        actions: [
          GestureDetector(
            onTap: () {
              context.read<AccountsProvider>().initializeEditAccountScreen();
              Navigator.pushNamed(context, '/edit-account');
            },
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset('assets/icons/edit.svg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 47),
            Center(
              child: Consumer<AccountsProvider>(
                builder: (context, accountsProvider, child) {
                  return Column(
                    children: [
                      Text(
                        accountsProvider.detailAccount?.name ?? '',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        formatMoney(
                          accountsProvider.detailAccount?.balance ?? 0,
                          context,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(33, 35, 37, 1),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 47),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<TransactionsProvider>(
                  builder: (context, transactionsProvider, child) {
                    return TransactionsListSection(
                      transactions:
                          transactionsProvider.separateTransactionsByDate(
                        transactionsProvider.transactionsForAccount,
                      ),
                      transactionsProvider: transactionsProvider,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
