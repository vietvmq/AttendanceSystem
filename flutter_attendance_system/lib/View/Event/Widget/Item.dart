import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterattendancesystem/View/Event/DetailEvent.dart';
import 'package:google_fonts/google_fonts.dart';

class EventViewItem extends StatelessWidget {
  final int index;
  EventViewItem({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailEvent(id: this.index)));
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 130,
        child: Card(
          margin: const EdgeInsets.all(5.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: <Widget>[
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)
                  ),
                  image: DecorationImage(
                    image: NetworkImage("https://link.fpo.vn/hinhdaihoi"),
                    fit: BoxFit.fill
                  )
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10,),
                      Container(
                        child: Text(
                          "Đại hội Mặt trận Tổ quốc Việt Nam",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          Text("Vào lúc:  "),
                          Text("7 giờ 30 phút")
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                          Text("Ngày:      "),
                          Text("24/3/2020")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
