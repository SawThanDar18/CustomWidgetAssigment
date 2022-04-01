import 'package:flutter/material.dart';

class BlackTextView extends StatelessWidget {
  final String text;
  final double fontSize;

  const BlackTextView({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
      ),
    );
  }
}
