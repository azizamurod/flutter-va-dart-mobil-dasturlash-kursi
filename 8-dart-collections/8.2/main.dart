void main() {
  // oddiy list
  var fruits = ['olma', 'anor', 'olcha'];

  // ma'lum turdagi list
  List<int> numbers = [1, 2, 3, 4, 5];

  // bo'sh list
  List<String> cities = [];

  // // element qo'shish
  // fruits.add('banan');

  // // elementni o'chirish
  // fruits.remove('olma');

  // // elementni belgilangan joyga qo'shish
  // fruits.insert(1, 'limon');

  // // listni tozalash
  // fruits.clear();

  // listdagi elementni olish
  String firstFruit = fruits[2];

  // length
  var count = cities.length;

  // contains
  bool hasApple = fruits.contains('shaftoli');

  // indexOf
  int appleIndex = fruits.indexOf('anor');

  // isEmpty isNotEmpty
  bool isEmptyList = fruits.isEmpty;

  for (int i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }
}
