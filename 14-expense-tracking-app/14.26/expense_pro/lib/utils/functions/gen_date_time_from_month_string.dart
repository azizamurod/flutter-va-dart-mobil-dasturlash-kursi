DateTime genDateTimeFromMonthString(String month) {
  final List<String> parts = month.split(', ');

  final monthNumber = months[parts[0]];
  final year = int.tryParse(parts[1]);

  return DateTime(year ?? 0, monthNumber ?? 0);
}

// input - January, 2025
// output - DateTime(2025, 1)

const months = {
  'January': 1,
  'February': 2,
  'March': 3,
  'April': 4,
  'May': 5,
  'June': 6,
  'July': 7,
  'August': 8,
  'September': 9,
  'October': 10,
  'November': 11,
  'December': 12,
};
