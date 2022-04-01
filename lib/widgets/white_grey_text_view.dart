import 'package:flutter/material.dart';

class WhiteGreyTextView extends StatelessWidget {

  final String text;
  final double textSize;
  final Color textColor;

  const WhiteGreyTextView({Key? key, required this.text, required this.textSize, this.textColor = Colors.white70}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: textColor,
      ),
    );
  }
}
