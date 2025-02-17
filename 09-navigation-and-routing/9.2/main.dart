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
      title: 'Flutter Demo',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birinchi ekran'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // push
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SecondScreen()),
            );
          },
          child: const Text("Ikkinchi ekranga o'tish"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ikkinchi ekran'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // pop
            Navigator.pop(context);
          },
          child: const Text("Orqaga qaytish"),
        ),
      ),
    );
  }
}
