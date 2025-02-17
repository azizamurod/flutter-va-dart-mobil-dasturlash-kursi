import 'package:flutter/material.dart';

import 'format_number.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTimeString(DateTime date) {
  String result = '${getTwoNumber(date.hour)}:${getTwoNumber(date.minute)}';
  return result;
}

String getDateString(DateTime date) {
  String result =
      '${getTwoNumber(date.day)}.${getTwoNumber(date.month)}.${date.year}';
  return result;
}

String getDateStringForTransactionDetailScreen(DateTime dateTime, BuildContext context,) {
  String result =
      '${getDayName(dateTime.weekday, context)} ${dateTime.day} ${getMonthName(dateTime.month, context)} ${dateTime.year}';
  return result;
}

String getDayName(int weekday, BuildContext context,) {
  final AppLocalizations localizations= AppLocalizations.of(context)!;

  final days = [
    localizations.monday,
    localizations.tuesday,
    localizations.wednesday,
    localizations.thursday,
    localizations.friday,
    localizations.saturday,
    localizations.sunday,
  ];

  return days[weekday - 1];
}

String getMonthName(int month, BuildContext context,) {
  final AppLocalizations localizations= AppLocalizations.of(context)!;

  final months = [
   localizations.january,
   localizations.february,
   localizations.march,
   localizations.april,
   localizations.may,
   localizations.june,
   localizations.july,
   localizations.august,
   localizations.september,
   localizations.october,
   localizations.november,
   localizations.december,
  ];

  return months[month - 1];
}

DateTime genDateTimeFromYearString(String year) {
  return DateTime(int.parse(year), 1, 1);
}

String genMonthForXAxis(double val, BuildContext context,) {
  String result = '';
  final AppLocalizations localizations= AppLocalizations.of(context)!;

  switch (val.toInt()) {
    case 0:
      result = localizations.january_short;
      break;
    case 31:
      result = localizations.february_short;
      break;
    case 62:
      result = localizations.march_short;
      break;
    case 93:
      result = localizations.april_short;
      break;
    case 124:
      result = localizations.may_short;
      break;
    case 155:
      result = localizations.june_short;
      break;
    case 186:
      result = localizations.july_short;
      break;
    case 217:
      result = localizations.august_short;
      break;
    case 248:
      result = localizations.september_short;
      break;
    case 279:
      result = localizations.october_short;
      break;
    case 310:
      result = localizations.november_short;
      break;
    case 341:
      result = localizations.december_short;
      break;
  }
  return result;
}
