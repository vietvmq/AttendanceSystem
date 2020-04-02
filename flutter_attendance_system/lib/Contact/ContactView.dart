import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Contact/Widget/Contact.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(right: 55),
            alignment: Alignment.center,
            child: Text(
              "FPO Co.,Ltd",
              style: GoogleFonts.lobster(fontSize: 30),
            ),
          ),
          flexibleSpace: GradientBar(),
          elevation: 0,
        ),
        body: Contact(),
      ),
    );
  }
}
