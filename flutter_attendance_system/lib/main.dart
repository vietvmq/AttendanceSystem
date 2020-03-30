import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/Login/LoginView.dart';
import 'ForgetPassword/Widget/ResetPassword.dart';
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
      home: ResetPasswordView(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(title: "Attendance Systems",),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


