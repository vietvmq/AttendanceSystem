import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
              child: Container(
                  height: 120, child: Image.asset("images/default.png")),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Center(
                  child: Text("Công nghệ mới - Giáo dục mới",
                      style: GoogleFonts.lobster(fontSize: 20))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Center(
                  child: Text("Đối tác",
                      style: GoogleFonts.lobster(fontSize: 40))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Center(
                  child: Wrap(
                children: <Widget>[
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/abc.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/codengreen.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/fma.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/garastem.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/hcmue.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/kaist.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/mechasolution.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/tkn.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/tst.png"),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20) / 2,
                      child: Card(
                        child: Image.asset("images/poly.png"),
                      )),
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Center(
                  child: Text("Liên hệ",
                      style: GoogleFonts.lobster(fontSize: 40))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Center(
                  child: Wrap(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child:
                        Center(child: Image.asset("images/location-arrow.png")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("Cơ sở",
                            style: GoogleFonts.lobster(fontSize: 20))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text(
                            "681/24/9 Âu Cơ, P.Tân Thành, Q.Tân Phú, TP. Hồ Chí Minh",
                            style: GoogleFonts.farro(fontSize: 16))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(child: Image.asset("images/office.png")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("Văn phòng đại diện",
                            style: GoogleFonts.lobster(fontSize: 20))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text(
                            "41, Lê Bình, Phường 4, Quận Tân Bình, TP. Hồ Chí Minh",
                            style: GoogleFonts.farro(fontSize: 16))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(child: Image.asset("images/phone-arrow.png")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("Điện thoại",
                            style: GoogleFonts.lobster(fontSize: 20))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("079 999 7407",
                            style: GoogleFonts.farro(fontSize: 16))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(child: Image.asset("images/mail-arrow.png")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("E-mail",
                            style: GoogleFonts.lobster(fontSize: 20))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Center(
                        child: Text("contact@fpo.vn",
                            style: GoogleFonts.farro(fontSize: 16))),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Text('2020 \u00a9 bản quyền thuộc về FPO Co.,Ltd')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Webviewer("https://www.facebook.com/FPOCompany/"),
                            ));
                          }),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Webviewer("https://www.youtube.com/channel/UC2xymGloIl8sL6ljhwbymsg"),
                            ));
                          }),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Webviewer extends StatelessWidget {
  final String url;

  Webviewer(this.url);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
