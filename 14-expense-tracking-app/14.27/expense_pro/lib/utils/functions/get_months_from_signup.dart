import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> getMonthsFromSignup(
  DateTime signedUpDate,
  BuildContext context,
) {
  List<String> months = [];
  final AppLocalizations localizations = AppLocalizations.of(context)!;

  DateTime startDate = signedUpDate;
  DateTime currentDate = DateTime.now();

  final monthsMap = {
    1: localizations.january,
    2: localizations.february,
    3: localizations.march,
    4: localizations.april,
    5: localizations.may,
    6: localizations.june,
    7: localizations.july,
    8: localizations.august,
    9: localizations.september,
    10: localizations.october,
    11: localizations.november,
    12: localizations.december,
  };

  while (startDate.isBefore(currentDate) ||
      (startDate.year == currentDate.year &&
          startDate.month == currentDate.month)) {
    months.add('${monthsMap[startDate.month]}, ${startDate.year}');
    startDate = DateTime(startDate.year, startDate.month + 1);
  }

  return months.reversed.toList();
}

// signedUpDate = DateTime(2024, 10, 1)
// output = ['Yanvar, 2025',  'Dekabr, 2024','Noyabr, 2024', ]

List<String> getOnlyMonths(
  DateTime date,
  BuildContext context,
) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;

  DateTime startDate = date;
  DateTime currentDate = DateTime.now();

  List<String> months = [];

  final monthsMap = {
    1: localizations.january,
    2: localizations.february,
    3: localizations.march,
    4: localizations.april,
    5: localizations.may,
    6: localizations.june,
    7: localizations.july,
    8: localizations.august,
    9: localizations.september,
    10: localizations.october,
    11: localizations.november,
    12: localizations.december,
  };

  if (startDate.year == currentDate.year) {
    while (startDate.isBefore(currentDate) ||
        (startDate.year == currentDate.year &&
            startDate.month == currentDate.month)) {
      months.add(monthsMap[startDate.month] ??'');
      startDate = DateTime(startDate.year, startDate.month + 1);
    }
  } else {
    months = [
      localizations.december,
      localizations.november,
      localizations.october,
      localizations.september,
      localizations.august,
      localizations.july,
      localizations.june,
      localizations.may,
      localizations.april,
      localizations.march,
      localizations.february,
      localizations.january,
    ];
  }
  return months.reversed.toList();
}

List<String> getYearsFromSignup(DateTime signedUpDate) {
  List<String> years = [];

  DateTime startDate = signedUpDate;
  DateTime currentDate = DateTime.now();

  while (
      startDate.isBefore(currentDate) || startDate.year == currentDate.year) {
    years.add(DateFormat('yyyy').format(startDate));
    startDate = DateTime(startDate.year + 1);
  }

  return years.reversed.toList();
}
