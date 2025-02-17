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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels == 0) {
            print('List boshida');
          } else {
            print('List oxirida');
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

          /// SingleChildScrollView() ishilatilish misoli

          // child: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //       Container(
          //         height: 400,
          //         width: 200,
          //         color: Colors.green,
          //         margin: EdgeInsets.all(20),
          //       ),
          //     ],
          //   ),
          // ),

          /// ListView() ishlatilish misoli

          // child: ListView(
          //   children: [
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //     Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     ),
          //   ],
          // ),

          /// ListView.builder ishlatilish misoli

          // child: ListView.builder(
          //   itemCount: 30,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 400,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     );
          //   },
          // ),

          /// GridView.builder ishlatilish misoli

          // child: GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //   ),
          //   itemBuilder: (context, index) {
          //     return Container(
          //       margin: EdgeInsets.all(10),
          //       color: Colors.blue,
          //       child: Center(
          //         child: Text(
          //           'Element ${index + 1}',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: 30,
          // ),

          /// PageView() ishilatilish misoli

          // child: PageView(
          //   children: [
          //     Container(
          //       color: Colors.red,
          //       child: Center(
          //         child: Text(
          //           '1-sahifa',
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.green,
          //       child: Center(
          //         child: Text(
          //           '2-sahifa',
          //         ),
          //       ),
          //     ),
          //     Container(
          //       color: Colors.orange,
          //       child: Center(
          //         child: Text(
          //           '3-sahifa',
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          /// ScrollController misoli

          // child: ListView.builder(
          //   controller: _scrollController,
          //   itemCount: 50,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 200,
          //       width: 200,
          //       color: Colors.green,
          //       margin: EdgeInsets.all(20),
          //     );
          //   },
          // ),
          ),
    );
  }
}
