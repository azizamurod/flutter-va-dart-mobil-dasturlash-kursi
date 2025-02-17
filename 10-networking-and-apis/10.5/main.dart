import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  // fetchPost();
  // createPost();
  // updatePost();
  // patchPost();
  deletePost();
}

// get
Future<void> fetchPost() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print('Post sarlavhasi: ${data['title']}');
  } else {
    print('Xatolik: ${response.statusCode}');
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
Future<void> deletePost() async {
  final response = await http.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
  );

  if (response.statusCode == 200) {
    print('Post ochirildi');
  } else {
    print('Xatolik: ${response.statusCode}');
  }
}
