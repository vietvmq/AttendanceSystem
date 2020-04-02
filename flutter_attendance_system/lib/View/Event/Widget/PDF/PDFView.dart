import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';

import 'PDFVIewInfo.dart';

class PDFView extends StatefulWidget {
  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  List<String> pathURL = [
    "http://www.pdf995.com/samples/pdf.pdf",
    "http://africau.edu/images/default/sample.pdf",
    "https://expoforest.com.br/wp-content/uploads/2017/05/exemplo.pdf",
    "https://www.ibm.com/downloads/cas/GJ5QVQ7X",
    "https://pdfkit.org/docs/guide.pdf",
  ];

  void initState() {
    super.initState();
  }

  Future<File> createFileOfPdfUrl(String pathUrl) async {
    final url = pathUrl;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body:ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: pathURL.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: createFileOfPdfUrl(pathURL[index]),
                  builder: (context, snapshot) {
                    if(snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return !snapshot.hasData
                        ? Center(child: CircularProgressIndicator(strokeWidth: 2.0,),)
                        : ListTile(
                            leading: Icon(Icons.file_download, size: 30,),
                            title: Text(pathURL[index], overflow: TextOverflow.fade,),
                            subtitle: Text(snapshot.data.path, overflow: TextOverflow.fade,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PDFScreen(snapshot.data.path)),
                              );
                            },
                          );
                  },
                );
              },
            ),
    );
  }
}
