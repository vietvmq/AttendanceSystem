import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final image = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(image),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 210.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 75,
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        margin: EdgeInsets.only(top: 24.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 90.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Võ Minh Quốc Việt"),
                            subtitle: Text("FPO Co., LTD"),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.qrcode),
                              iconSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(image),
                                fit: BoxFit.cover
                            )
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Thông tin cá nhân"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.userEdit),
                            iconSize: 25,
                          )
                        ),
                        Divider(height: 1.0,),
                        ListTile(
                          title: Text("Mã số"),
                          subtitle: Text("44.01.104.243"),
                          leading: Icon(Icons.code),
                        ),
                        ListTile(
                          title: Text("Số điện thoại"),
                          subtitle: Text("0932730113"),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("mylikemylove2017@gmail.com"),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Giới tính"),
                          subtitle: Text("Nam"),
                          leading: Icon(FontAwesomeIcons.male),
                        ),
                        ListTile(
                          title: Text("Ngày sinh"),
                          subtitle: Text("15 February 2000"),
                          leading: Icon(Icons.calendar_today),
                        ),
                        ListTile(
                          title: Text("Địa chỉ"),
                          subtitle: Text("41 - Lê Bình - Phường 4 - Quận Tân Bình - TP.HCM"),
                          leading: Icon(Icons.home),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}