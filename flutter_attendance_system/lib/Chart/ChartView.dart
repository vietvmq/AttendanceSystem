import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Chart/Widget/Chart.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(right: 55),
          alignment: Alignment.center,
          child: Text(
            "Bảng thống kê",
            style: GoogleFonts.lobster(fontSize: 30),
          ),
        ),
        flexibleSpace: GradientBar(),
        elevation: 0,
      ),
      body: SafeArea(child: PieChart()),
    );
  }
}
