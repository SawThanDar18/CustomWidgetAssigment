import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:flutter/material.dart';

class GradientView extends StatelessWidget {
  const GradientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [GRADIENT_START_COLOR, GRADIENT_END_COLOR],
        ),
      ),
    );
  }
}
