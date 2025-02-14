import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Icon(Icons.star, color: Colors.red),
        //     Text('Yulduz'),
        //     ElevatedButton(onPressed: (){}, child: Text('Bosish')),
        //   ],
        // ),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Text('Birinchi qator'),
        //     Text('Ikkinchi qator'),
        //     ElevatedButton(onPressed: (){}, child: Text('Bosish')),
        //   ],
        // ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up, color: Colors.blue),
                Text('Yoqtirish'),
                Icon(Icons.thumb_down, color: Colors.red)
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text('Tugma')),
          ],
        ),
      ),

    );
  }
}
