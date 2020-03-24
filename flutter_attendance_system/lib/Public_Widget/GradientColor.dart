import 'package:flutter/material.dart';

var gradientColor = [
  Color(0xFF03A9F4),
  Color(0xFF039BE5),
  Color(0xFF0288D1),
  Color(0xFF0277BD),
  Color(0xFF01579B),
];

class GradientBar extends StatefulWidget {
  @override
  _GradientBarState createState() => _GradientBarState();
}

class _GradientBarState extends State<GradientBar> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColor)),
    );
  }
}