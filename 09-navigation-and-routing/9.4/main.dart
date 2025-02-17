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
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (_) => const FirstScreen(),
        '/second': (_) => const SecondScreen(),
      },
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
            final result = await Navigator.pushNamed(
              context,
              '/second',
              arguments: {'username': 'Ali'},
            );
            if (result is String) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(result)));
            }
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
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final userName = arguments['username'] ?? '';
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
