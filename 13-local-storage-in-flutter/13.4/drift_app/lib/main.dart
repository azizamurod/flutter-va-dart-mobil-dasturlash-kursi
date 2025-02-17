import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:my_second_app/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();

  // ma'lumot qo'shish
  const task = TasksCompanion(
    title: Value('Flutter darslarini organish'),
    isCompleted: Value(false),
  );
  db.insertTask(task);

  // ma'lumotlarni olish
  List<Task> tasks = await db.getAllTasks();
  print('Vazifalar soni: ${tasks.length}');
  for (var task in tasks) {
    print(
      'Vazifa: ${task.title}, Bajarilgan: ${task.isCompleted}, ID: ${task.id}',
    );
  }

  // ma'lumotlarni yangilash
  const updatedTask = Task(
    id: 1,
    title: 'Drift kutubxonasini organish',
    isCompleted: true,
  );
  db.updateTask(updatedTask);

  // ma'lumotlarni olish
  tasks = await db.getAllTasks();
  print('Vazifalar soni: ${tasks.length}');
  for (var task in tasks) {
    print(
      'Vazifa: ${task.title}, Bajarilgan: ${task.isCompleted}, ID: ${task.id}',
    );
  }

  // ma'lumotlarni o'chirish
  db.deleteTask(1);

  // ma'lumotlarni olish
  tasks = await db.getAllTasks();
  print('Vazifalar soni: ${tasks.length}');
  for (var task in tasks) {
    print(
      'Vazifa: ${task.title}, Bajarilgan: ${task.isCompleted}, ID: ${task.id}',
    );
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
