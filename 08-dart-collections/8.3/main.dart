void main() {
  // oddiy set
  var fruits = {'olma', 'banan', 'uzum'};
  Set<String> colors = {'qizil', 'yashil', "ko'k"};

  // bo'sh set yaratish
  Set<int> numbers = {};

  // element qo'shish
  colors.add('sariq');
  colors.add('sariq');
  colors.add('qizil');

  // bir nechta element qo'shish
  colors.addAll({'oq', 'pushti'});

  // elementni o'chirish
  colors.remove('qizil');

  // setni tozalash
  // colors.clear();

  for (var color in colors) {
    // print(color);
  }

  // contains
  bool hasRed = colors.contains('qizil');

  // length
  int count = colors.length;

  // isEmpty isNotEmpty
  bool isEmptySet = colors.isEmpty;

  // union
  // var moreColors = {'siyohrang', 'jigarrang', 'yashil'};
  // var allColors = colors.union(moreColors);

  // intersection
  var moreColors = {'siyohrang', 'jigarrang', 'yashil'};
  var allColors = colors.intersection(moreColors);
  print(allColors);
}
