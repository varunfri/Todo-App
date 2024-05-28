import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/home.dart';

void main() async {
  await Hive.initFlutter();

  //creating a variable to open a database
  await Hive.openBox('myBox');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
      // home: const Home(),
    );
  }
}
