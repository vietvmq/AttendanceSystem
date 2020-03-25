import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:flutterattendancesystem/View/Home/Widget/ListPageView.dart';
import 'package:flutterattendancesystem/View/Home/Widget/DrawerMenu.dart';
import 'package:flutterattendancesystem/View/Home/Widget/FloatingButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widget/SeatDiagram.dart';

class HomePage extends StatefulWidget {
  final title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentBottomIndex = 0;
  final _pageController = PageController();

  List<BottomNavigationBarItem> listBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Trang chủ"),
      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.location_on),
//        title: Text("Vị trí"),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.assignment),
//        title: Text("Tài liệu"),
//      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        title: Text("Thông báo"),
      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.calendar_today),
//        title: Text("Lịch"),
//      ),
    ];
  }

  List<Widget> _listPages= <Widget>[
    HomeView(),
    NotificationView(),
  ];

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentBottomIndex = index;
        });
      },
      children: _listPages,
    );
  }

  void bottomTapped(int index) {
    setState(() {
      _currentBottomIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 2), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const SizedBox(width: 55,),
            Text(
              this.widget.title,
              style: GoogleFonts.lobster(),
            ),
          ],
        ),
        flexibleSpace: GradientBar(),
        elevation: 0,
      ),
      drawer: DrawerUser(),
      body: _buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        //unselectedItemColor: Colors.grey.shade400,
        onTap: (index) => bottomTapped(index),
        selectedItemColor: Colors.deepOrange,
        currentIndex: _currentBottomIndex,
        items: listBottomNavBarItems(),
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
