import 'package:cms/dbHelper/mongodb.dart';
import 'package:cms/pages/Sections/Student/Add/add_Student.dart';
import 'package:flutter/material.dart';
import 'package:cms/pages/loginPage.dart';
import 'package:cms/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const loginPage(),
        '/mainPage': (context) => const mainPage(),
        '/addStudent': (context) => const addStudent()
      },
    );
  }
}
