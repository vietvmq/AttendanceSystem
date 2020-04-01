import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/ForgetPassword/ForgetPasswordView.dart';
import 'package:flutterattendancesystem/Login/LoginView.dart';
import 'Chart/ChartView.dart';
import 'ForgetPassword/Widget/ResetPassword.dart';
import 'View/Home/HomePage.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main(){
  SyncfusionLicense.registerLicense('NT8mJyc2IWhia31ifWN9YGVoYmF8YGJ8ampqanNiYmlmamlmanMDHmg3ITcyJ2JnYmYTND4yOj99MDw+');

  return runApp(MyApp());
}

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


