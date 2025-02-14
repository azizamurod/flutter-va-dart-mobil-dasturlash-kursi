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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
      
      //  child: Text(
      //   'Text widgeti misoli', 
      //   style: TextStyle(
      //     fontSize: 24, 
      //     color: Colors.blue, 
      //     fontWeight: FontWeight.bold,
      //     ),
      //   ),

      // child: Image.network(
      //   'https://static1.squarespace.com/static/61c4da8eb1b30a201b9669f2/t/63c2c510e4486c6eeec22877/1673708816370/Deep-Ecology-1.jpg?format=1500w',
      //   width: 400,
      // ),

        // child: Image.asset(
        //   'assets/images/spirituality-ecology-and-sustainable-farming-893x510.jpg',
        // ),

        child: Icon(
          Icons.menu,
          color: Colors.brown,
          size: 100,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
