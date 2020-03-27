import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Login/LoginView.dart';
import 'View/Home/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(title: "Attendance Systems",),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


