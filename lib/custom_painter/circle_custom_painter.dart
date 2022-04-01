import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CircleCustomPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    //canvas.drawCircle(Offset(size.width / 2, size.height / 2), 120, firstCirclePaint);

    var secondCirclePaint = Paint()
      ..strokeWidth = 15.0
      ..color = THIRD_CIRCLE_COLOR
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 150, secondCirclePaint);

    const double gap = pi / 180 * 8.0;
    const double singleAngle = (pi * 2) / 20;

    for (int i = 0; i < 20; i++) {
      canvas.drawArc(
          const Rect.fromLTWH(80.0, 42.0, 230, 230), gap + singleAngle * i,
          singleAngle - gap * 2, false, firstCirclePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class ThirdCirclePaint extends CustomPainter {
  ThirdCirclePaint({
    required this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 8.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(const Offset(302, 40), 25, firstCirclePaint);

    var paint = Paint()
      ..strokeWidth = 4.0
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawLine(const Offset(310, 150), const Offset(375, 150), paint);

    var drawImageWidth = 200.0;
    var drawImageHeight = size.height * 0.15;

    Path path = Path()
      ..addOval(Rect.fromLTWH(277, drawImageHeight, 50, 50));

    canvas.clipPath(path);

    canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class SecondCirclePaint extends CustomPainter {
  SecondCirclePaint({
    required this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(198, 315), 25, firstCirclePaint);

    var drawImageWidth = 30.0;
    var drawImageHeight = size.height * 2.92;

    Path path = Path()
      ..addOval(Rect.fromLTWH(175.5, drawImageHeight, 45, 45));

    canvas.clipPath(path);

    canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class FirstCirclePaint extends CustomPainter {
  FirstCirclePaint({
    required this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()
      ..strokeWidth = 5.0
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(73, 253.6), 25, firstCirclePaint);

    var drawImageWidth = 0.0;
    var drawImageHeight = size.height * 2.31;

    Path path = Path()
      ..addOval(Rect.fromLTWH(50, drawImageHeight, 45, 45))
    ;

    canvas.clipPath(path);

    canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class CircleCustomPainter extends StatefulWidget {
  const CircleCustomPainter({Key? key}) : super(key: key);

  @override
  State<CircleCustomPainter> createState() => _CircleCustomPainterState();
}

class _CircleCustomPainterState extends State<CircleCustomPainter> {
  late ui.Image _image;

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  _loadImage() async {
    ByteData bd = await rootBundle.load("assets/images/profile.jpg");

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final ui.Codec codec = await ui.instantiateImageCodec(bytes);

    final ui.Image image = (await codec.getNextFrame()).image;

    setState(() => _image = image);
  }

  /*getUiImage(String imageAssetPath, int height, int width) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      assetImageByteData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    final ui.Image image = (await codec.getNextFrame()).image;

    setState(() => _image = image);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: SECOND_CIRCLE_COLOR,
              gradient: LinearGradient(
                  colors: [GRADIENT_START_COLOR, GRADIENT_END_COLOR]),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                height: 150,
                decoration: const BoxDecoration(
                  color: FIRST_CIRCLE_COLOR,
                  shape: BoxShape.circle,
                ),
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
          ),
          Stack(
            children: [
              Center(
                child: CustomPaint(
                  size: const Size(500, 500),
                  painter: CircleCustomPaint(),
                ),
              ),
              CustomPaint(
                size: const Size(100, 100),
                painter: FirstCirclePaint(image: _image),
              ),
              CustomPaint(
                size: const Size(100, 100),
                painter: SecondCirclePaint(image: _image),
              ),
              CustomPaint(
                size: const Size(100, 100),
                painter: ThirdCirclePaint(image: _image),
              ),
            ],
          ),
          /*Positioned(
            top: 11,
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(100, 100),
                  painter: ImageCirclePaint(image: _image),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: GRADIENT_END_COLOR,
                  ),
                  margin:  EdgeInsets.only(top: 320, left: 175),
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
/*Positioned(
                top: 200,
                left: 30,
                child: Stack(
                  children: [
                    Container(
                      width: CIRCLE_IMAGE_WIDTH,
                      height: CIRCLE_IMAGE_HEIGHT,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomPaint(
                      size: const Size(100, 100),
                      painter: FirstCirclePaint(image: _image),
                    ),
                  ],
                ),
              ),*/