import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyBudgetText extends StatelessWidget {
  const EmptyBudgetText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.empty_budget_text_1,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(145, 145, 159, 1),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.empty_budget_text_2,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(145, 145, 159, 1),
            ),
          ),
        ],
      ),
    );
  }
}
