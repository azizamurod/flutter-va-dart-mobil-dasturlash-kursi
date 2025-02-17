import 'format_number.dart';

String getTimeString(DateTime date) {
  String result = '${getTwoNumber(date.hour)}:${getTwoNumber(date.minute)}';
  return result;
}

String getDateString(DateTime date) {
  String result =
      '${getTwoNumber(date.day)}.${getTwoNumber(date.month)}.${date.year}';
  return result;
}

String getDateStringForTransactionDetailScreen(DateTime dateTime) {
  String result =
      '${getDayName(dateTime.weekday)} ${dateTime.day} ${getMonthName(dateTime.month)} ${dateTime.year}';
  return result;
}

String getDayName(int weekday) {
  const days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  return days[weekday - 1];
}

String getMonthName(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  return months[month - 1];
}

DateTime genDateTimeFromYearString(String year) {
  return DateTime(int.parse(year), 1, 1);
}

String genMonthForXAxis(double val) {
  String result = '';
  switch (val.toInt()) {
    case 0:
      result = 'Jan';
      break;
    case 31:
      result = 'Feb';
      break;
    case 62:
      result = 'Mar';
      break;
    case 93:
      result = 'Apr';
      break;
    case 124:
      result = 'May';
      break;
    case 155:
      result = 'Jun';
      break;
    case 186:
      result = 'Jul';
      break;
    case 217:
      result = 'Aug';
      break;
    case 248:
      result = 'Sep';
      break;
    case 279:
      result = 'Oct';
      break;
    case 310:
      result = 'Nov';
      break;
    case 341:
      result = 'Dec';
      break;
  }
  return result;
}
