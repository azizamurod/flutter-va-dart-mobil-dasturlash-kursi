import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/widgets/bottom_sheets/select_month_and_year_bottom_sheet.dart';

class MonthSwitcher extends StatelessWidget {
  const MonthSwitcher({
    super.key,
    required this.months,
    required this.selectedMonth,
    required this.selectMonth,
  });

  final List<String> months;
  final String? selectedMonth;
  final Function(String, BuildContext) selectMonth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSelectMonthAndYearBottomSheet(
        context: context,
                title: AppLocalizations.of(context)!.select_month,

        selected: selectedMonth,
        months: months,
        onTap: (String val) {
          Navigator.pop(context);
          selectMonth(val, context);
        },
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            bottom: 8,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 250, 1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/arrow-down.svg'),
              const SizedBox(width: 4),
              Text(
                selectedMonth ?? AppLocalizations.of(context)!.month,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(33, 35, 37, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
