import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/main/transactions/transactions_list_section.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Account',
        textColor: const Color.fromRGBO(33, 35, 37, 1),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/edit-account',
            ),
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
              child: Column(
                children: [
                  Text(
                    'Paypal',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$2400',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(33, 35, 37, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 47),
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TransactionsListSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
