import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFScreen extends StatefulWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Document"),
        elevation: 5.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      path: widget.pathPDF,
    );
  }
}
