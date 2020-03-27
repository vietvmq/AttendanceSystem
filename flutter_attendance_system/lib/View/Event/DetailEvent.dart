import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterattendancesystem/Public_Widget/ExpandableText.dart';
import 'package:flutterattendancesystem/View/Event/Widget/PDF/PDFView.dart';
import 'package:flutterattendancesystem/View/Event/Widget/SeatDiagram.dart';
import 'package:flutterattendancesystem/View/Event/Widget/Timeline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final String longText =
    """Với chủ đề “Đoàn kết - Dân chủ - Đổi mới - Phát triển”, sáng 19-9, Đại hội đại biểu toàn quốc Mặt trận Tổ quốc Việt Nam lần thứ IX, nhiệm kỳ 2019-2024 khai mạc trọng thể tại Trung tâm Hội nghị Quốc gia, Hà Nội.

Đại hội diễn ra trong ba ngày (từ 18 đến 20-9) với sự tham dự của 1.300 đại biểu, trong đó có 999 đại biểu chính thức.

Tại phiên họp diễn ra trong ngày đầu tiên của Đại hội (18-9), thay mặt Đoàn Chủ tịch Ủy ban Trung ương Mặt trận Tổ quốc Việt Nam, Phó Chủ tịch - Tổng Thư ký Hầu A Lềnh đã báo cáo kiểm điểm hoạt động của Ủy ban, Đoàn Chủ tịch và Ban Thường trực Ủy ban Trung ương Mặt trận Tổ quốc Việt Nam khóa VIII, nhiệm kỳ 2014-2019, trong đó nêu bật những thành tựu đã đạt được và cả những hạn chế cần khắc phục trong nhiệm kỳ tới.""";

class DetailEvent extends StatefulWidget {
  final int id;
  DetailEvent({Key key, this.id}) : super(key: key);
  @override
  _DetailEventState createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {

  void pushPageByIndex(int index) {
    switch(index){
      case 0: {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFView()));
        break;
      }
      case 1: {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeatScreen()));
        break;
      }
      case 2: {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimelinePage(title: "",)));
        break;
      }
    }
  }

  Widget _customIconButton(
      IconData icon, String label, Color color, int index) {
    return GestureDetector(
      onTap: () {
        pushPageByIndex(index);
      },
      child: Container(
        height: 86,
        margin: const EdgeInsets.all(2.0),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(26, 32, 7, 20),
              alignment: Alignment.centerRight,
              child: Opacity(
                  opacity: 0.35,
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  )),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    autoplay: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset(
                          "images/daihoi.jpg",
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 8.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text(
                "Mặt trận Tổ quốc Việt Nam Đại hội IX",
                style: GoogleFonts.lobster(
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Text(
                      "Thời gian dự kiến",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold,),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Bắt đầu: ",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          "7 giờ 30 phút",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Kết thúc: ",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          "11 giờ 30 phút",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Text(
                      "Thông tin sự kiện",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ExpandableText(longText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(

        height: 90,
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Expanded(
              child: _customIconButton(FontAwesomeIcons.fileAlt, "Tài liệu",
                  Colors.blue.withOpacity(0.75), 0),
            ),
            Expanded(
              child: _customIconButton(Icons.location_on, "Vị trí",
                  Colors.greenAccent[400].withOpacity(0.7), 1),
            ),
            Expanded(
              child: _customIconButton(FontAwesomeIcons.calendarCheck, "Lịch",
                  Colors.deepOrange[600].withOpacity(0.7), 2),
            ),
          ],
        ),
      ),
    );
  }
}
