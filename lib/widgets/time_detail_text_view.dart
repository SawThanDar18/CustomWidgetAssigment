import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:flutter/material.dart';

class TimeDetailTextView extends StatelessWidget {

  final Color color;
  final String text;

  const TimeDetailTextView({Key? key, this.color = Colors.white70, this.text = " 8:30 AM - 02:00 PM"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: CAROUSEL_TIME_ICON_SIZE, color: color,),
        WhiteGreyTextView(text: text, textSize: FONT_SIZE_14, textColor: color,),
      ],
    );
  }
}
