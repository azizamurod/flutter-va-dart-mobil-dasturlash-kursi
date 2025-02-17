import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  // fetchPost();
  // createPost();
  // updatePost();
  // patchPost();
  // deletePost(token);
  fetchPost();
}

Future<String?> login() async {
  final response = await http.post(
    Uri.parse('https://reqres.in/api/login'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    ),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data['token'];
  } else {
    throw Exception('Error');
  }
}

// get
Future<void> fetchPost() async {
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Post sarlavhasi: ${data['title']}');
      print("Post muvaffaqiyatli yakunlandi");
    } else if (response.statusCode == 401) {
      print('Iltimos tizimga kiring');
    } else if (response.statusCode == 404) {
      print("Post topilmadi");
    } else if (response.statusCode == 500) {
      print("Serverda muammo bor, iltimos keyinroq urinib koring");
    } else {
      print('Xatolik: ${response.statusCode}');
    }
  } catch (e) {
    print(
        "Internet bilan muammo yoki serverga ulanishda xatolik yuz berdi: $e");
  }
}

// post
Future<void> createPost() async {
  final response = await http.post(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "title": "Yangi post",
      "body": "yangi postning body si",
    }),
  );

  if (response.statusCode == 201) {
    var data = jsonDecode(response.body);
    print('Post sarlavhasi: ${data['title']}, postning ids: ${data['id']}');
  } else {
    print('Xatolik: ${response.statusCode}');
  }
}

// put
Future<void> updatePost() async {
  final response = await http.put(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "title": "Yangilangan sarlavha",
      "body": "yangilangan postning body si",
      "userId": 1,
    }),
  );

  if (response.statusCode == 200) {
    print('Post muvaffaqiyatli yangilandi');
  } else {
    print('Xatolik: ${response.statusCode}');
  }
}

// patch
Future<void> patchPost() async {
  final response = await http.put(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "title": "Qisman yangilangan sarlavha",
    }),
  );

  if (response.statusCode == 200) {
    print('Post sarlavhasi muvaffaqiyatli yangilandi');
  } else {
    print('Xatolik: ${response.statusCode}');
  }
}

// delete
Future<void> deletePost(String? token) async {
  final response = await http.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer: $token",
    },
  );

  if (response.statusCode == 200) {
    print('Post ochirildi');
  } else {
    print('Xatolik: ${response.statusCode}');
  }
}
