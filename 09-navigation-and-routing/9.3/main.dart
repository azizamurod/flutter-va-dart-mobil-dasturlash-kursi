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
          onPressed: () async {
            // push
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SecondScreen(userName: 'Ali'),
              ),
            );
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(result)));
          },
          child: const Text("Ikkinchi ekranga o'tish"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
    required this.userName,
  });

  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xush kelibsiz, $userName'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // pop
            Navigator.pop(context, 'Xayr');
          },
          child: const Text("Orqaga qaytish"),
        ),
      ),
    );
  }
}
