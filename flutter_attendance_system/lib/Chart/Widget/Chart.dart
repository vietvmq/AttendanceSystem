import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterattendancesystem/Chart/ChartView.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Data {
  Data(this.address, this.count);

  String address;
  int count;
}

class PieChart extends StatelessWidget {
  static List<UserData> listUser = [
    UserData(30, "TPHCM"),
    UserData(30, "TPHCM"),
    UserData(29, "Đà Lạt"),
    UserData(21, "TPHCM"),
    UserData(25, "Phan Thiết"),
    UserData(25, "Hà Nội"),
    UserData(21, "Vùng Tàu"),
  ];

  bool checkAddress() {}

  void analysisData(List<UserData> a, List<Data> data) {
    for (int i = 0; i < a.length; i++) {
      int count = a.where((c) => c.address == a[i].address).toList().length;
      Data alpha = Data(a[i].address, count);
      var existingItem = data.firstWhere(
          (itemToCheck) => itemToCheck.address == alpha.address,
          orElse: () => null);
      if (existingItem == null) {
        int count = a.where((c) => c.address == a[i].address).toList().length;
        Data alpha = Data(a[i].address, count);
        data.add(alpha);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Data> data = List<Data>();
    analysisData(listUser, data);
    return SfCircularChart(
      borderColor: Colors.black,
      title: ChartTitle(
          text: "Bảng thống kê", textStyle: ChartTextStyle(fontSize: 20)),
      legend: Legend(
          isVisible: true,
          textStyle: ChartTextStyle(fontSize: 17),
          position: LegendPosition.bottom,
          itemPadding: 20,
          overflowMode: LegendItemOverflowMode.wrap,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries<Data, String>>[
        DoughnutSeries<Data, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '13%',
          dataSource: data,
          xValueMapper: (Data data, _) => data.address,
          yValueMapper: (Data data, _) => data.count,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: ChartTextStyle(fontSize: 17),
          ),
        )
      ],
    );
  }
}
