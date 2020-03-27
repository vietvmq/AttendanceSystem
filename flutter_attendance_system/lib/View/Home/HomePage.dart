import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:flutterattendancesystem/View/Home/Widget/ListPageView.dart';
import 'package:flutterattendancesystem/View/Home/Widget/DrawerMenu.dart';
import 'package:flutterattendancesystem/View/Home/Widget/FloatingButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Event/Widget/SeatDiagram.dart';

class HomePage extends StatefulWidget {
  final title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomIndex = 0;
  final _pageController = PageController();

  List<BottomNavigationBarItem> listBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Trang chủ"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        title: Text("Thông báo"),
      ),
    ];
  }

  List<Widget> _listPages= <Widget>[
    HomeView(),
    NotificationView(),
  ];

  Widget _buildPageView() {
    return PageView(
      //physics: NeverScrollableScrollPhysics(),
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
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 9.0),
          child: Text(
            this.widget.title,
            style: GoogleFonts.lobster(fontSize: 30),
          ),
        ),
        flexibleSpace: GradientBar(),
        elevation: 0,
      ),
      drawer: DrawerUser(),
      body: _buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 27,
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

