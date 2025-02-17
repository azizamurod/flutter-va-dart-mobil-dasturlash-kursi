import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/widgets/buttons/custom_button.dart';

class SetUpAccountsScreen extends StatelessWidget {
  const SetUpAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 67),
                  Text(
                    AppLocalizations.of(context)!.setup_account,
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(33, 35, 37, 1),
                    ),
                  ),
                  const SizedBox(height: 37),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      AppLocalizations.of(context)!.account_description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(41, 43, 45, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: AppLocalizations.of(context)!.lets_go,
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              onTap: () {
                 context.read<AccountsProvider>().resetCreateAccountScreen();
                Navigator.pushNamed(
                  context,
                  '/create-account',
                  arguments: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
