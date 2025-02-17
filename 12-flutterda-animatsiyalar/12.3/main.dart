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
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   duration: const Duration(seconds: 1),
            //   color: isToggled ? Colors.blue : Colors.red,
            //   width: isToggled ? 200 : 100,
            //   height: isToggled ? 200 : 100,
            // ),

            // AnimatedOpacity(
            //   duration: const Duration(seconds: 1),
            //   opacity: isToggled ? 1 : 0,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),

            // AnimatedAlign(
            //   duration: const Duration(seconds: 1),
            //   alignment: isToggled ? Alignment.topLeft : Alignment.topRight,
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),

            AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: isToggled
                  ? const EdgeInsets.all(50)
                  : const EdgeInsets.all(10),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            Switch(
              value: isToggled,
              onChanged: (_) {
                setState(() {
                  isToggled = !isToggled;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
