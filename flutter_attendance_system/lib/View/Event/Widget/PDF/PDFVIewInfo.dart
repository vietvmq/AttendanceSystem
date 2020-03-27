import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class InfoScreen extends StatefulWidget {
  final PDFDocument document;
  InfoScreen({Key key, this.document}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("file PDF"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: PDFViewer(document: widget.document,)))
          ],
        ));
  }
}