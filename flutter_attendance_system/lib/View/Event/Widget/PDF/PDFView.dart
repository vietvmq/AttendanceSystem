import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


import 'PDFVIewInfo.dart';

class PDFView extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PDFView> {
  List<String> pathAssets = ["DeLy", "III"];
  List<String> pathURL = [
    "http://africau.edu/images/default/sample.pdf",
    "https://expoforest.com.br/wp-content/uploads/2017/05/exemplo.pdf",
  ];  
  List<String> listDemo = List.generate(2, (index) => "Tai lieu dai hoi $index");
  PDFDocument document;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFromAsset(pathAssets[0]);
    //loadFromURL(pathURL[0]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Danh sách tài liệu",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: listDemo.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: GestureDetector(
                    onTap: () async {
                      print(index);
                      loadFromAsset(index < 2 ? pathAssets[index] : pathAssets[index % 2]);
                      //loadFromURL(index < 2 ? pathAssets[index] : pathAssets[index % 2]);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              InfoScreen(document: document)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, bottom: 10),
                            child: Image(
                              image: AssetImage('images/file.png'),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(listDemo[index]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 10, left: 10),
                                child: Text('Tài liệu đại hội'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
    );
  }

  void loadFromAsset(String name) async {
    document = await PDFDocument.fromAsset("files/${name.toString()}.pdf");
  }
  // void loadFromURL(String url) async {
  //   document = await PDFDocument.fromURL(url);
  // }
}


