import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  String? token = await login();
  deletePost(token);
  print("token---- $token");
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
