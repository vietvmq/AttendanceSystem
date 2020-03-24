import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';
import 'package:flutterattendancesystem/View/Home/Widget/BottomAppBar.dart';
import 'package:flutterattendancesystem/View/Home/Widget/DrawerMenu.dart';
import 'package:flutterattendancesystem/View/Home/Widget/FloatingButton.dart';
import 'Widget/SeatDiagram.dart';

class HomePage extends StatefulWidget {
  final title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomIndex = 0;
  final _pageController = PageController();

  List<Widget> _listItems = <Widget>[
    SeatScreen(),
    Red(),
    Blue(),
    Yellow(),
  ];

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentBottomIndex = index;
        });;
      },
      children: _listItems,
    );
  }
  void bottomTapped(int index) {
    setState(() {
      _currentBottomIndex = index;
      //_pageController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.decelerate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        flexibleSpace: GradientBar(),
      ),
      drawer: DrawerUser(),
      body: _listItems.elementAt(_currentBottomIndex),
      bottomNavigationBar: BottomBar(
        height: 60,
        color: Colors.blue.shade300,
        selectedColor: Colors.red,
        iconSize: 25,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: bottomTapped,
        items: [
          BottomAppBarItem(iconData: Icons.location_on, text: 'Vị trí'),
          BottomAppBarItem(iconData: Icons.assignment, text: 'Tài liệu'),
          BottomAppBarItem(iconData: Icons.notifications, text: 'Thông báo'),
          BottomAppBarItem(iconData: Icons.calendar_today, text: 'Lịch'),
        ],
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
