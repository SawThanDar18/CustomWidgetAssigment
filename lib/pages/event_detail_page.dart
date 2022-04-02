import 'package:custom_widget_assignment/custom_painter/circle_custom_painter.dart';
import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/resources/strings.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_text_view.dart';
import 'package:flutter/material.dart';

import '../widgets/event_carousel_slider_view.dart';
import '../widgets/treatment_detail_carousel_slider_view.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2, top: MARGIN_X_LARGE),
          child: Icon(
            Icons.arrow_back,
            size: DETAIL_APPBAR_ICON_SIZE,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: MARGIN_X_LARGE),
          child: Center(
            child: WhiteTextView(text: TODAY_TEXT, fontSize: FONT_SIZE_18),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: MARGIN_X_LARGE, right: MARGIN_MEDIUM_2),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  size: DETAIL_APPBAR_ICON_SIZE,
                  color: Colors.white,
                ),
                SizedBox(
                  width: SIZED_BOX_HEIGHT_10,
                ),
                Icon(
                  Icons.menu,
                  size: DETAIL_APPBAR_ICON_SIZE,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
        backgroundColor: GRADIENT_START_COLOR,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: SCROLLABLE_CONTAINER_HEIGHT,
            ),
            Positioned(
              height: MediaQuery.of(context).size.height,
              child: const FirstPositionedView(),
            ),
            Positioned(
              top: DETAIL_PAGE_TEXT_MARGIN_TOP,
                child: Container(
                  margin: const EdgeInsets.only(left: MARGIN_28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      WhiteTextView(text: "Office No. 248", fontSize: FONT_SIZE_20,),
                      SizedBox(
                        height: SIZED_BOX_HEIGHT_2,
                      ),
                      WhiteGreyTextView(text: "3 patients", textSize: FONT_SIZE_14)
                    ],
                  ),
                ),
            ),
            Positioned(
              top: DETAIL_PAGE_CIRCLE_MARGIN_TOP,
                height: DETAIL_PAGE_CIRCLE_HEIGHT,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width,
                    child: const CircleCustomPainter()),
            ),
            Positioned(
              top: DETAIL_PAGE_SECOND_POSITIONED_MARGIN_TOP,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: DETAIL_PAGE_SECOND_POSITIONED_SIZED_BOX_HEIGHT,
                child: const TreatmentDetailSliderView(),
              ),
            ),
            Positioned(
              top: DETAIL_PAGE_THIRD_POSITIONED_MARGIN_TOP,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: SIZED_BOX_HEIGHT_120,
                child: const EventCarouselSliderView(isHomePage: false,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPositionedView extends StatelessWidget {
  const FirstPositionedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          color: GRADIENT_START_COLOR,
        ),
        Container(
          height:  TWO_COLOR_CONTAINER_HEIGHT,
          width: MediaQuery.of(context).size.width,
          color: GRADIENT_END_COLOR,
        ),
      ],
    );
  }
}
