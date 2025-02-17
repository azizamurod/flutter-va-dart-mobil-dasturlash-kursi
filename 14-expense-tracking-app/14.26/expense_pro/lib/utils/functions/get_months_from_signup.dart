import 'package:intl/intl.dart';

List<String> getMonthsFromSignup(DateTime signedUpDate) {
  List<String> months = [];

  DateTime startDate = signedUpDate;
  DateTime currentDate = DateTime.now();

  while (startDate.isBefore(currentDate) ||
      (startDate.year == currentDate.year &&
          startDate.month == currentDate.month)) {
    months.add(DateFormat('MMMM, yyyy').format(startDate));
    startDate = DateTime(startDate.year, startDate.month + 1);
  }

  return months.reversed.toList();
}

// signedUpDate = DateTime(2024, 10, 1)
// output = ['Yanvar, 2025',  'Dekabr, 2024','Noyabr, 2024', ]

List<String> getOnlyMonths(DateTime date) {
  DateTime startDate = date;
  DateTime currentDate = DateTime.now();

  List<String> months = [];

  if (startDate.year == currentDate.year) {
    while (startDate.isBefore(currentDate) ||
        (startDate.year == currentDate.year &&
            startDate.month == currentDate.month)) {
      months.add(DateFormat('MMMM').format(startDate));
      startDate = DateTime(startDate.year, startDate.month + 1);
    }
  } else {
    months = [
      'December',
      'November',
      'October',
      'September',
      'August',
      'July',
      'June',
      'May',
      'April',
      'March',
      'February',
      'January',
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
