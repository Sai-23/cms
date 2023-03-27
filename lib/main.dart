import 'package:cms/dbHelper/mongodb.dart';
import 'package:cms/pages/Student/Add/add_Student.dart';
import 'package:cms/pages/Student/Display/display_student.dart';
import 'package:cms/pages/splash_screen.dart';
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
        '/': (context) => const splashScreen(),
        '/loginPage':(context)=>const loginPage(),
        '/mainPage': (context) => const mainPage(),
        '/addStudent': (context) => const addStudent(),
        '/displayStudent':(context)=>const DisplayStudent()
      }
    );
  }
}
