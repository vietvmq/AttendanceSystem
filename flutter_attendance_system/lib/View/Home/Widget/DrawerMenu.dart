import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutterattendancesystem/Chart/ChartView.dart';
import 'package:flutterattendancesystem/Contact/ContactView.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:flutterattendancesystem/Public_Widget/OvalRightBorderClipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterattendancesystem/Public_Widget/WaveClipperOne.dart';

import 'Profile.dart';

class DrawerUser extends StatelessWidget {
  final image = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media';
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: OvalRightBorderClippers(),
      child: Drawer(
        elevation: 10.0,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _buildDrawer(context),
                ListTile(
                  title: Text("Thông tin tài khoản", style: GoogleFonts.roboto(fontSize: 16),),
                  leading: Icon(FontAwesomeIcons.userShield, size: 25,),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                ListTile(
                  title: Text("Báo cáo", style: GoogleFonts.roboto(fontSize: 16),),
                  leading: Icon(Icons.assignment, size: 25,),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Thống kê", style: GoogleFonts.roboto(fontSize: 16),),
                  leading: Icon(Icons.assessment, size: 25,),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChartView()));
                  },
                ),
                ListTile(
                  title: Text("Liên hệ", style: GoogleFonts.roboto(fontSize: 16),),
                  leading: Icon(Icons.contacts, size: 25,),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactView()));
                  },
                ),
                //Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Đăng xuất", style: GoogleFonts.roboto(fontSize: 16),),
                  leading: Icon(Icons.power_settings_new, size: 25,),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(context) {
    return ClipPath(
      clipper: WaveClipperOnes(),
      child: Container(
        height: 270,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(image,),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.solidSun, color: Colors.white,),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(
                "Võ Minh Quốc Việt",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Text(
                "Sinh viên",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
