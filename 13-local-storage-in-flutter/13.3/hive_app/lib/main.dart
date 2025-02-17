import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    createBox();
    super.initState();
  }

  void createBox() async {
    var box = await Hive.openBox('myBox');

    // ma'lumotlarni saqlash
    box.put('username', 'student');
    box.put('isLoggedIn', true);

    // ma'lumotlarni olish
    var username = box.get('username');
    var isLoggedIn = box.get('isLoggedIn');
    print('Foydalanuvchi nomi: $username');
    print('Kirish holati: $isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
