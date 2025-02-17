import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  fetchData().then((User user) {
    print(user.name);
  });
}

Future<User> fetchData() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Ma'lumot yuklanmadi");
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
