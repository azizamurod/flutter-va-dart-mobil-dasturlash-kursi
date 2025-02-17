import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

DateTime genDateTimeFromMonthString(String month, BuildContext context,) {
  final List<String> parts = month.split(', ');
  final AppLocalizations localizations= AppLocalizations.of(context)!;

final months = {
  localizations.january:1,
   localizations.february:2,
   localizations.march:3,
   localizations.april:4,
   localizations.may:5,
   localizations.june:6,
   localizations.july:7,
   localizations.august:8,
   localizations.september:9,
   localizations.october:10,
   localizations.november:11,
   localizations.december:12,
};


  final monthNumber = months[parts[0]];
  final year = int.tryParse(parts[1]);

  return DateTime(year ?? 0, monthNumber ?? 0);
}

// input - January, 2025
// output - DateTime(2025, 1)

