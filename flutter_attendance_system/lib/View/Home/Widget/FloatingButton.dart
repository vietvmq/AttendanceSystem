import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';
import 'package:flutterattendancesystem/Public_Widget/qr_scanner_overlay_shape.dart';
import 'dart:io';


class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      child: Icon(Icons.camera_alt, color: Colors.white, size: 35,),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRView()));
      },
    );
  }
}

class QRView extends StatefulWidget {
  @override
  _QRViewPageState createState() => _QRViewPageState();
}
class _QRViewPageState extends State<QRView> {
  final _captureController = new QRCaptureController();
  bool _isTorchOn = false;
  Icon iconFlash = Icon(
    Icons.flash_off,
    color: Colors.white,
  );
  var gradientColor = [
    Color(0xFF03A9F4),
    Color(0xFF039BE5),
    Color(0xFF0288D1),
    Color(0xFF0277BD),
    Color(0xFF01579B),
  ];

  void initState() {
    super.initState();
    _captureController.onCapture((data) {
      _captureController.pause();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Thông tin QR"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Text("$data"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _captureController.resume();
                },
                child: Text("OK", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ));
    });
  }

  Widget _buildToolBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton.icon(
          icon: iconFlash,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(width: 1.0, color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              if (_isTorchOn) {
                _captureController.torchMode = CaptureTorchMode.off;
                iconFlash = Icon(
                  Icons.flash_off,
                  color: Colors.white,
                );
              } else {
                _captureController.torchMode = CaptureTorchMode.on;
                iconFlash = Icon(
                  Icons.flash_on,
                  color: Colors.white,
                );
              }
              _isTorchOn = !_isTorchOn;
            });
          },
          label: Text(
            'Đèn pin',
            style: TextStyle(color: Colors.white),
          ),
        ),
//        FlatButton.icon(
//          icon: Icon(
//            Icons.play_arrow,
//            color: Colors.white,
//          ),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(10.0),
//            side: BorderSide(width: 1.0, color: Colors.white),
//          ),
//          onPressed: () {
//            _captureController.resume();
//          },
//          label: Text(
//            'Tiếp tục',
//            style: TextStyle(color: Colors.white),
//          ),
//        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            QRCaptureView(controller: _captureController,),
            Container(
              height: double.infinity,
              decoration: ShapeDecoration(
                shape: QrScannerOverlayShape(
                  cutOutSize: Platform.isAndroid ? 260 : 280,
                  borderColor: Colors.green,
                ),
              ),
            ),
            Positioned(
              top: 55.0,
              left: 15.0,
              child: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              bottom: 25.0,
              child: _buildToolBar(),
            )
          ]),
    );
  }
}