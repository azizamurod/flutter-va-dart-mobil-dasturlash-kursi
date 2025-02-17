import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/buttons/custom_button.dart';
import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/main/account/account_card.dart';

class AccountsListScreen extends StatelessWidget {
  const AccountsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Account',
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Column(
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
                      'Account Balance',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(145, 145, 159, 1),
                      ),
                    ),
                    Text(
                      '\$9400',
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
                  ...[
                    {'name': 'Wallet', 'amount': 400.0},
                    {'name': 'Chase', 'amount': 1000.0},
                    {'name': 'City', 'amount': 6000.0},
                    {'name': 'Paypal', 'amount': 2000.0},
                    {'name': 'Wallet', 'amount': 400.10},
                    {'name': 'Chase', 'amount': 1000.25},
                    {'name': 'City', 'amount': 6000.0},
                    {'name': 'Paypal', 'amount': 2000.0},
                    {'name': 'Wallet', 'amount': 400.0},
                    {'name': 'Chase', 'amount': 1000.0},
                    {'name': 'City', 'amount': 6000.0},
                    {'name': 'Paypal', 'amount': 2000.0},
                    {'name': 'Wallet', 'amount': 400.0},
                    {'name': 'Chase', 'amount': 1000.0},
                    {'name': 'City', 'amount': 6000.0},
                    {'name': 'Paypal', 'amount': 2000.0},
                  ].map(
                    (el) {
                      return AccountCard(
                        name: el['name'] as String,
                        amount: el['amount'] as double,
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/account-detail',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            CustomButton(
              text: '+ Add new wallet',
              margin: const EdgeInsets.all(16),
              onTap: () => Navigator.pushNamed(
                context,
                '/create-account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
