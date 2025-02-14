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
        // child: Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.blue,
        //   padding: EdgeInsets.only(right: 100),
        //   child: Text(
        //     'Container ichidagi matn',
        //     style: TextStyle(
        //       fontSize: 24,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),

        // child: Container(
        //   width: 250,
        //   height: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.green,
        //     borderRadius: BorderRadius.circular(15),
        //     border: Border.all(
        //       color: Colors.black,
        //       width: 2,
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.5),
        //         spreadRadius: 5,
        //         blurRadius: 7,
        //         offset: Offset(0, 3),
        //       )
        //     ],
        //   ),
        //   child: Center(
        //     child: Text(
        //       'Dekorativ kontainer',
        //       style: TextStyle(
        //         fontSize: 24,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),

        // child: Container(
        //   padding: EdgeInsets.all(20),
        //   decoration: BoxDecoration(
        //     color: Colors.blueGrey,
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         width: 150,
        //         height: 150,
        //         color: Colors.orange,
        //         child: Center(
        //           child: Text(
        //             'Birinchi container',
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 20),
        //       Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.purple,
        //         child: Center(
        //           child: Text(
        //             'Ikkinchi container',
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        child: Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Gradientli container',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
