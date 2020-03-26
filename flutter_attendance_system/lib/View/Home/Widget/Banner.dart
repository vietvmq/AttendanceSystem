import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterattendancesystem/Public_Widget/GradientColor.dart';

class BannerEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColor)
              ),
            ),
            clipper: OvalBottomBorderClipper(),
          ),
          Swiper(
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: MediaQuery.of(context).size.height / 5,
            layout: SwiperLayout.DEFAULT,
            autoplay: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
//                          image: DecorationImage(
//                            image: CachedNetworkImageProvider(
//                              "https://nld.mediacdn.vn/2019/9/19/7076484227862771213915708512880877255000064n-1568861748575239539590.jpg"
//                            ),
//                            fit: BoxFit.cover,
//                          ),
                ),
                child: Image.asset(
                  "images/daihoi.jpg",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
