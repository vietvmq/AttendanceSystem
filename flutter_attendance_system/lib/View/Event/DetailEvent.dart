import 'package:flutter/material.dart';

class DetailEvent extends StatefulWidget {
  final int id;
  DetailEvent({Key key, this.id}) : super(key: key);
  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.id.toString()),
        ),
      ),
    );
  }
}
