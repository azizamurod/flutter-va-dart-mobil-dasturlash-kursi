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
