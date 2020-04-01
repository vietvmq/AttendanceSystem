import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Chart/Widget/Chart.dart';

class UserData {
  UserData(this.age,this.address);

  final double age;
  final String address;
}

class ChartView extends StatefulWidget {
  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PieChart()),
    );
  }
}
