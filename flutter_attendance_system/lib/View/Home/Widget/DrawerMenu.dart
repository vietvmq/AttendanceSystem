import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:flutterattendancesystem/Public_Widget/OvalRightBorderClipper.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClippers(),
      child: Drawer(
        elevation: 10.0,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _buildDrawer(context),
                ListTile(
                  title: Text("Thông tin tài khoản", style: GoogleFonts.roboto(fontSize: 17),),
                  leading: Icon(Icons.person_outline, size: 25,),
                  onTap: () {},
                ),
                Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Báo cáo", style: GoogleFonts.roboto(fontSize: 17),),
                  leading: Icon(Icons.assignment, size: 25,),
                  onTap: () {},
                ),
                Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Thống kê", style: GoogleFonts.roboto(fontSize: 17),),
                  leading: Icon(Icons.assessment, size: 25,),
                  onTap: () {},
                ),
                Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Liên hệ", style: GoogleFonts.roboto(fontSize: 17),),
                  leading: Icon(Icons.contacts, size: 25,),
                  onTap: () {},
                ),
                Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Đăng xuất", style: GoogleFonts.roboto(fontSize: 17),),
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
      clipper: MovieTicketClipper(),
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColor),
        ),
        currentAccountPicture: CircleAvatar(
          child: FlutterLogo(
            size: 50,
          ),
          backgroundColor: Colors.white,
        ),
        accountName: Text(
          "Nguyễn Văn Anh",
          style: TextStyle(fontSize: 19),
        ),
        accountEmail: Text(
          "Sinh viên",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
