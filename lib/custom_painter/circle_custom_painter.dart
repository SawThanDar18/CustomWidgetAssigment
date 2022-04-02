import 'dart:math';
import 'dart:ui' as ui;

import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_text_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InnerCircleCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, ui.Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 2.0
      ..color = FIRST_CIRCLE_COLOR
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 60, firstCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class CircleCustomPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    const double gap = pi / 180 * 8.0;
    const double singleAngle = (pi * 2) / 20;

    for (int i = 0; i < 20; i++) {
      canvas.drawArc(
          const Rect.fromLTWH(80.0, 42.0, 230, 230), gap + singleAngle * i,
          singleAngle - gap * 2, false, firstCirclePaint);
    }

    var secondCirclePaint = Paint()
      ..strokeWidth = 15.0
      ..color = THIRD_CIRCLE_COLOR
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, secondCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class ThirdCirclePaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(const Offset(302, 40), 25, firstCirclePaint);

    var paint = Paint()
      ..strokeWidth = 4.0
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawLine(const Offset(310, 150), const Offset(375, 150), paint);

    var drawImageHeight = size.height * 0.26;

    final tooth = FontAwesomeIcons.tooth.codePoint;
    final toothFontPackage = FontAwesomeIcons.tooth.fontPackage;
    final toothFontFamily = FontAwesomeIcons.tooth.fontFamily;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(tooth),
        style: TextStyle(
            fontSize: 25.0,
            fontFamily: toothFontFamily,
            package: toothFontPackage));
    textPainter.layout();
    textPainter.paint(canvas, Offset(291, drawImageHeight));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class SecondCirclePaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(198, 315), 25, firstCirclePaint);

    var drawImageHeight = size.height * 3;

    final tooth = FontAwesomeIcons.tooth.codePoint;
    final toothFontPackage = FontAwesomeIcons.tooth.fontPackage;
    final toothFontFamily = FontAwesomeIcons.tooth.fontFamily;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(tooth),
        style: TextStyle(
            fontSize: 25.0,
            fontFamily: toothFontFamily,
            package: toothFontPackage));
    textPainter.layout();
    textPainter.paint(canvas, Offset(185, drawImageHeight));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class FirstCirclePaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {


    var firstCirclePaint = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(73, 253.6), 25, firstCirclePaint);

    var drawImageHeight = size.height * 2.4;

    Path path = Path()
      ..addOval(Rect.fromLTWH(50, drawImageHeight, 45, 45))
    ;

    canvas.clipPath(path);

    final tooth = FontAwesomeIcons.tooth.codePoint;
    final toothFontPackage = FontAwesomeIcons.tooth.fontPackage;
    final toothFontFamily = FontAwesomeIcons.tooth.fontFamily;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(tooth),
        style: TextStyle(
            fontSize: 25.0,
            fontFamily: toothFontFamily,
            package: toothFontPackage));
    textPainter.layout();
    textPainter.paint(canvas, Offset(60, drawImageHeight));

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class CircleCustomPainter extends StatelessWidget {
  const CircleCustomPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [GRADIENT_START_COLOR, GRADIENT_END_COLOR]),
              shape: BoxShape.circle,
            ),
          ),
          ),
          Center(
            child: CustomPaint(
              size: const Size(100, 100),
              painter: InnerCircleCustomPaint(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WhiteTextView(
                    text: "2:45",
                    fontSize: FONT_SIZE_25,
                  ),
                  WhiteGreyTextView(
                    text: "PM",
                    textSize: FONT_SIZE_18,
                  ),
                ],
              ),

            ),
          ),
          Center(
            child: CustomPaint(
              size: const Size(500, 500),
              painter: CircleCustomPaint(),
            ),
          ),
          CustomPaint(
            size: const Size(100, 100),
            painter: FirstCirclePaint(),
          ),
          CustomPaint(
            size: const Size(100, 100),
            painter: SecondCirclePaint(),
          ),
          CustomPaint(
            size: const Size(100, 100),
            painter: ThirdCirclePaint(),
          ),
        ],
      ),
    );
  }
}
