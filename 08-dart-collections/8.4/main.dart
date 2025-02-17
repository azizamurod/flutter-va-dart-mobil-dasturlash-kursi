void main() {
  // oddiy map
  // var student = {
  //   'name': 'Zafar',
  //   'age': '21',
  //   'subject': 'MAtematika',
  // };

  // turi belgilangan map
  Map<String, String> student = {
    'name': 'Zafar',
    'age': '21',
    'subject': 'Matematika',
  };

  // bosh map yaratish
  var scores = {};

  // element qoshish
  student['grade'] = 'A';

  // element o'chirish
  student.remove('age');

  // barcha elementlarni ochirish
  // student.clear();

  // map ichidagi elementlarga kirish
  var name = student['name'];

  // containsKey
  bool hasAge = student.containsKey('age');

  // containsValue
  bool hasNameZafar = student.containsValue('Zafar');

  // length
  var count = student.length;

  // keys, values
  var allKeys = student.keys;
  var allValues = student.values;

  // for loop
  for (var key in student.keys) {
    print('$key:  ${student[key]}');
  }

  // forEach
  student.forEach(
    (key, value) {
      print('$key: $value');
    },
  );
}
