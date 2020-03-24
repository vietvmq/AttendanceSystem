import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  QrScannerOverlayShape({
    this.borderColor = Colors.red,
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 100),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  }) : assert(
  cutOutSize != null
      ? cutOutSize != null
      ? borderLength <= cutOutSize / 2 + borderWidth * 2
      : true
      : true,
  "Border can't be larger than ${cutOutSize / 2 + borderWidth * 2}");

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path _getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return _getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final width = rect.width;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final _cutOutSize = cutOutSize != null && cutOutSize < width
        ? cutOutSize
        : width - borderOffset;

    final backgroundPaint = Paint()..color = overlayColor;

    final borderPaint = Paint()..color = borderColor;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..blendMode = BlendMode.srcOut;

    // set position of Rectangle
    final cutOutRect = Rect.fromLTWH(
      width / 2 - _cutOutSize / 2 + borderOffset,
      height / (Platform.isAndroid ? 2 : 3) - _cutOutSize / 2 + borderOffset,
      _cutOutSize - borderOffset * 2,
      _cutOutSize - borderOffset * 2,
    );

    //Draw background
    var paint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    canvas.saveLayer(
      rect,
      backgroundPaint,
    );

    canvas
      ..drawRect(
        Rect.fromLTRB(rect.left, rect.top, rect.right, cutOutRect.top),
        paint,
      )
      ..drawRect(
        Rect.fromLTRB(rect.left, cutOutRect.bottom, rect.right, rect.bottom),
        paint,
      )
      ..drawRect(
        Rect.fromLTRB(
            rect.left, cutOutRect.top, cutOutRect.left, cutOutRect.bottom),
        paint,
      )
      ..drawRect(
        Rect.fromLTRB(
            cutOutRect.right, cutOutRect.top, rect.right, cutOutRect.bottom),
        paint,
      )
    ;

    //Draw text
    TextPainter(
      text: TextSpan(
        text: "Vui lòng để mã QR ngay giữa màn hình ",
        style: TextStyle(color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    )
      ..layout(maxWidth: width, minWidth: width)
      ..paint(
        canvas,
        Offset(cutOutRect.left + (Platform.isAndroid ? 6 : 20), cutOutRect.bottom + 15),
      );

    // Draw the corners of Rectangle
    canvas
    // Draw top right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - 3,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + 20,
          bottomLeft: Radius.circular(4),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - 20,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + 3,
          bottomLeft: Radius.circular(4),
        ),
        borderPaint,
      )
    // Draw top left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + 3,
          cutOutRect.top + 20,
          bottomRight: Radius.circular(4),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + 20,
          cutOutRect.top + 3,
          bottomRight: Radius.circular(4),
        ),
        borderPaint,
      )
    // Draw bottom right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - 3,
          cutOutRect.bottom - 20,
          cutOutRect.right,
          cutOutRect.bottom,
          topLeft: Radius.circular(4),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - 20,
          cutOutRect.bottom - 3,
          cutOutRect.right,
          cutOutRect.bottom,
          topLeft: Radius.circular(4),
        ),
        borderPaint,
      )
    // Draw bottom left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - 20,
          cutOutRect.left + 3,
          cutOutRect.bottom,
          topRight: Radius.circular(4),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - 3,
          cutOutRect.left + 20,
          cutOutRect.bottom,
          topRight: Radius.circular(4),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          cutOutRect,
          Radius.circular(borderRadius),
        ),
        boxPaint,
      )
      ..restore();
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}


// Draw the heart
 class HeartPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      // TODO: implement paint
      Paint paint = Paint();
      paint
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 6;

      Paint paint1 = Paint();
      paint1
        ..color = Colors.red
        ..style = PaintingStyle.fill
        ..strokeWidth = 0;

      double width = size.width;
      double height = size.height;

      Path path = Path();
      path.moveTo(0.5 * width, height * 0.35);
      path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
          0.5 * width, height);
      path.moveTo(0.5 * width, height * 0.35);
      path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
          0.5 * width, height);

      canvas.drawPath(path, paint1);
      canvas.drawPath(path, paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
  }
