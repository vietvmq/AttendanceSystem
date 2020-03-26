import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);
  final String text;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
              constraints: isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 100.0),
              child: new Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ))),
      isExpanded
          ? new FlatButton(
          child: const Text('Thu gọn', style: TextStyle(color: Colors.blue),),
          highlightColor: Colors.blue.shade50,
          onPressed: () => setState(() => isExpanded = false))
          : new FlatButton(
          child: const Text('Xem thêm', style: TextStyle(color: Colors.blue),),
          highlightColor: Colors.blue.shade50,
          onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}