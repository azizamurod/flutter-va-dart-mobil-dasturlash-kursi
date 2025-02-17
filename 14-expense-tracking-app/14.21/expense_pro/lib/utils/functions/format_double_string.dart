String formatDoubleString(double number) {
  return '${number.toString().endsWith('.0') ? number.toInt() : number}';
}
