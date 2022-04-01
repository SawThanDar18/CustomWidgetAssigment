import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/resources/strings.dart';
import 'package:custom_widget_assignment/widgets/black_text_view.dart';
import 'package:custom_widget_assignment/widgets/event_carousel_slider_view.dart';
import 'package:custom_widget_assignment/widgets/gradient_view.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_text_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/event_list_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(
        children: [
          Positioned(
            height: FIRST_POSITIONED_HEIGHT,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: const [
                Positioned.fill(
                  child: GradientView(),
                ),
                FirstPositionedView(),
              ],
            ),
          ),
          Positioned(
            top: SECOND_POSITIONED_MARGIN_TOP,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: SIZED_BOX_HEIGHT_120,
              child: const EventCarouselSliderView(),
            ),
          ),
          Positioned(
            top: THIRD_POSITIONED_MARGIN_TOP,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
              child: Column(
                children: [
                  const TimeAndEventsLabelView(),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(right: MARGIN_MEDIUM_3),
                    child: Column(
                      children: const [
                        Expanded(
                          child: EventListView(),
                        ),
                        SizedBox(
                          height: SIZED_BOX_HEIGHT_500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeAndEventsLabelView extends StatelessWidget {
  const TimeAndEventsLabelView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BlackTextView(text: TIME_TEXT, fontSize: FONT_SIZE_16),
        SizedBox(
          width: SIZED_BOX_HEIGHT_18,
        ),
        DottedLine(
          dashLength: 6,
          dashGapLength: 10,
          lineThickness: 2,
          dashColor: GRADIENT_END_COLOR,
          dashGapColor: Colors.transparent,
          direction: Axis.vertical,
          lineLength: 60,
        ),
        SizedBox(
          width: SIZED_BOX_HEIGHT_25,
        ),
        BlackTextView(text: EVENT_TEXT, fontSize: FONT_SIZE_16),
      ],
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
          margin: const EdgeInsets.all(MARGIN_MEDIUM_3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SEARCH_LAYOUT_WIDTH,
                height: SEARCH_LAYOUT_HEIGHT,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius:
                      BorderRadius.circular(SEARCH_LAYOUT_BORDER_RADIUS),
                ),
                child: const SearchTextAndIconView(),
              ),
              const ProfileView(),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(MARGIN_MEDIUM_3),
          child: const PatientTextRowView(),
        ),
      ],
    );
  }
}

class PatientTextRowView extends StatelessWidget {
  const PatientTextRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WhiteTextView(text: MY_PATIENT_TEXT, fontSize: FONT_SIZE_20),
            SizedBox(
              height: SIZED_BOX_HEIGHT_3,
            ),
            WhiteGreyTextView(text: TOTAL_TEXT, textSize: FONT_SIZE_14),
          ],
        ),
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: BLUE_LIGHT_COLOR,
                borderRadius:
                    BorderRadius.circular(TODAY_LAYOUT_BORDER_RADIUS)),
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_TEN),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  WhiteGreyTextView(text: TODAY_TEXT, textSize: FONT_SIZE_12),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.white70,
                    size: DOWN_ARROW_ICON_SIZE,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
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
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: NOTI_CONTAINER_WIDTH,
            width: NOTI_CONTAINER_HEIGHT,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Center(
              child: WhiteTextView(text: "4", fontSize: FONT_SIZE_12),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchTextAndIconView extends StatelessWidget {
  const SearchTextAndIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: WhiteGreyTextView(text: SEARCH_TEXT, textSize: FONT_SIZE_16),
        ),
        Padding(
          padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
          child: Icon(
            Icons.search,
            size: SEARCH_ICON_SIZE,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
