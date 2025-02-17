import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DetailScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'cake',
                child: Image.asset(
                  "assets/images/cake.jpg",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Cake',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail screen'),
      ),
      body: Scaffold(
        body: Hero(
          tag: 'cake',
          child: Image.asset(
            "assets/images/cake.jpg",
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
