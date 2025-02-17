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
  String result = '${getDayName(dateTime.weekday)} ${dateTime.day} ${getMonthName(dateTime.month)} ${dateTime.year}';
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
