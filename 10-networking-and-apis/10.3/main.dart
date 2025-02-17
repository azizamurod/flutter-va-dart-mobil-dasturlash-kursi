void main() {
  fetchData().then(
    (_) {
      print("Ma'lumot muvaffaqiyatli yuklandi.");
    },
  ).catchError(
    (e) {
      print("Xatolik yuk yuz berdi: $e");
    },
  ).whenComplete(
    () {
      print('Yuklash jarayoni tugadi');
    },
  );
}

// internetdan ma'lumot yuklash jarayoni
Future<void> fetchData() async {
  // print("Ma'lumot yuklanmoqda...");

  await Future.delayed(Duration(seconds: 3));
  // throw UnimplementedError();

  // print("Ma'lumot yuklandi!");
}
