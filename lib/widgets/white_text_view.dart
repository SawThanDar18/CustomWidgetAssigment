import 'package:flutter/material.dart';

class WhiteTextView extends StatelessWidget {
  final String text;
  final double fontSize;

  const WhiteTextView({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
      ),
    );
  }
}
