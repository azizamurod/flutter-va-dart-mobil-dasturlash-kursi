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
