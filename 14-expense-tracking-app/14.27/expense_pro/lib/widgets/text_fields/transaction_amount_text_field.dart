import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

class TransactionAmountTextField extends StatelessWidget {
  const TransactionAmountTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(252, 252, 252, 1),
            ),
          ),
          Row(
            children: [
              Text(
                context.read<SettingsProvider>().getCurrencySign(),
                style: GoogleFonts.inter(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(252, 252, 252, 1),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 64,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(252, 252, 252, 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
