import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/View/Event/Item.dart';
import 'Banner.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              if(index == 0) {
                return BannerEvent();
              }
              return EventViewItem(index: index,);
            },
          ),
      ),
    );
  }
}

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Bạn chưa có bất kì sự kiện nào"),),
    );
  }
}
