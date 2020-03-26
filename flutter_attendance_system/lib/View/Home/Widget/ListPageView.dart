import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/View/Event/Item.dart';
import 'package:lottie/lottie.dart';
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
            if (index == 0) {
              return BannerEvent();
            }
            return EventViewItem(
              index: index,
            );
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.only(bottom: 5.0),
          child: Lottie.asset("animate/noti.json", fit: BoxFit.cover,),
        ),
        Text("Bạn chưa có bất kì sự kiện nào"),
      ],
      ),
    );
  }
}
