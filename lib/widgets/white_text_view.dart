import 'package:flutter/material.dart';

class WhiteTextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;

  const WhiteTextView({Key? key, required this.text, required this.fontSize, this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
