//import 'package:flutter/material.dart';
//import 'package:flutterattendancesystem/View/Event/Item.dart';
//import 'Banner.dart';

//class Bottom extends StatefulWidget {
//  @override
//  _BottomState createState() => _BottomState();
//}
//
//class _BottomState extends State<Bottom> {
//  int _currentBottomIndex = 0;
//
//  List<BottomNavigationBarItem> listBottomNavBarItems() {
//    return [
//      BottomNavigationBarItem(
//        icon: Icon(Icons.home),
//        title: Text("Trang chủ"),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.location_on),
//        title: Text("Vị trí"),
//      ),
//      BottomNavigationBarItem(
//      icon: Icon(Icons.assignment),
//      title: Text("Tài liệu"),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.notifications),
//        title: Text("T.báo"),
//      ),
//      BottomNavigationBarItem(
//      icon: Icon(Icons.calendar_today),
//      title: Text("Lịch"),
//      ),
//    ];
//  }
//
////  PageController pageController = PageController(
////    initialPage: 0,
////    keepPage: true,
////  );
////
////  void pageChanged(int index) {
////    setState(() {
////      _currentBottomIndex = index;
////    });
////  }
////
////
////  Widget buildPageView() {
////    return PageView(
////      controller: pageController,
////      onPageChanged: (index) {
////        pageChanged(index);
////      },
////      children: <Widget>[
////        Red(),
////        SeatScreen(),
////        Blue(),
////        Yellow(),
////      ],
////    );
////  }
//
//    void bottomTapped(int index) {
//      setState(() {
//        _currentBottomIndex = index;
//      });
//    }
//
//  @override
//  Widget build(BuildContext context) {
//    return BottomAppBar(
//      notchMargin: 5,
//      clipBehavior: Clip.antiAlias,
//      shape: CircularNotchedRectangle(),
//      child: BottomNavigationBar(
//        onTap: (index) => bottomTapped(index),
//        selectedItemColor: Colors.blue,
//        currentIndex: _currentBottomIndex,
//        items: listBottomNavBarItems(),
//        type: BottomNavigationBarType.fixed,
//      ),
//    );
//  }
//}

//BottomBar(
//height: 60,
//color: Colors.blue.shade300,
//selectedColor: Colors.red,
//iconSize: 25,
//notchedShape: CircularNotchedRectangle(),
//onTabSelected: bottomTapped,
//items: [
//BottomAppBarItem(iconData: Icons.location_on, text: 'Vị trí'),
//BottomAppBarItem(iconData: Icons.assignment, text: 'Tài liệu'),
//BottomAppBarItem(iconData: Icons.notifications, text: 'Thông báo'),
//BottomAppBarItem(iconData: Icons.calendar_today, text: 'Lịch'),
//],
//)

//class Red extends StatefulWidget {
//  @override
//  _RedState createState() => _RedState();
//}
//class _RedState extends State<Red> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.red,
//    );
//  }
//}
//
//class Blue extends StatefulWidget {
//  @override
//  _BlueState createState() => _BlueState();
//}
//class _BlueState extends State<Blue> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.blueAccent,
//    );
//  }
//}
//
//class Yellow extends StatefulWidget {
//  @override
//  _YellowState createState() => _YellowState();
//}
//class _YellowState extends State<Yellow> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.yellowAccent,
//    );
//  }
//}
//
//class Green extends StatefulWidget {
//  @override
//  _GreenState createState() => _GreenState();
//}
//class _GreenState extends State<Green> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.green,
//    );
//  }
//}
//
//class BottomAppBarItem {
//  BottomAppBarItem({this.iconData, this.text});
//  IconData iconData;
//  String text;
//}
//class BottomBar extends StatefulWidget {
//  BottomBar({
//    this.items,
//    this.centerItemText,
//    this.height: 60.0,
//    this.iconSize: 24.0,
//    this.backgroundColor,
//    this.color,
//    this.selectedColor,
//    this.notchedShape,
//    this.onTabSelected,
//  }) {
//    assert(this.items.length == 2 || this.items.length == 4);
//  }
//  final List<BottomAppBarItem> items;
//  final String centerItemText;
//  final double height;
//  final double iconSize;
//  final Color backgroundColor;
//  final Color color;
//  final Color selectedColor;
//  final NotchedShape notchedShape;
//  final ValueChanged<int> onTabSelected;
//
//  @override
//  State<StatefulWidget> createState() => BottomBarState();
//}
//class BottomBarState extends State<BottomBar> {
//  int _selectedIndex = 0;
//
//  _updateIndex(int index) {
//    widget.onTabSelected(index);
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    List<Widget> items = List.generate(widget.items.length, (int index) {
//      return _buildTabItem(
//        item: widget.items[index],
//        index: index,
//        onPressed: _updateIndex,
//      );
//    });
//    items.insert(items.length >> 1, _buildMiddleTabItem());
//
//    return BottomAppBar(
//      shape: widget.notchedShape,
//      child: Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: items,
//      ),
//      color: widget.backgroundColor,
//    );
//  }
//
//  Widget _buildMiddleTabItem() {
//    return Expanded(
//      child: SizedBox(
//        height: widget.height,
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            SizedBox(height: widget.iconSize),
//            Text(
//              widget.centerItemText ?? '',
//              style: TextStyle(color: widget.color),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _buildTabItem({
//    BottomAppBarItem item,
//    int index,
//    ValueChanged<int> onPressed,
//  }) {
//    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
//    return Expanded(
//      child: SizedBox(
//        height: widget.height,
//        child: Material(
//          type: MaterialType.transparency,
//          child: InkWell(
//            borderRadius: BorderRadius.circular(35.0),
//            onTap: () => onPressed(index),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Icon(item.iconData, color: color, size: widget.iconSize),
//                Text(
//                  item.text,
//                  style: TextStyle(color: color),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}




