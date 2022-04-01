import 'package:custom_widget_assignment/widgets/smart_list_view.dart';
import 'package:custom_widget_assignment/widgets/time_detail_text_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../pages/event_detail_page.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class EventListView extends StatefulWidget {
  const EventListView({Key? key}) : super(key: key);

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  @override
  Widget build(BuildContext context) {
    return SmartListView(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return DisableEventItemView(onTapEvent: () => _navigateToEventDetailsScreen(context),);
          } else {
            return EventItemView(onTapEvent: () => _navigateToEventDetailsScreen(context),);
          }
        },
        onListStart: () => _showToast("Scroll to see More Data!", context),
        onListEndReached: () => _showToast("There has no Data!", context));
  }

  _showToast(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  void _navigateToEventDetailsScreen(BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventDetailPage()));
  }
}

class EventItemView extends StatelessWidget {
  final Function onTapEvent;

  const EventItemView({Key? key, required this.onTapEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTapEvent();},
      child: Row(
        children: [
          Column(
            children: const [
              Text(
                "8:00",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: FONT_SIZE_14,
                ),
              ),
              SizedBox(
                height: SIZED_BOX_HEIGHT_60,
              ),
              Text(
                "8:30",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: FONT_SIZE_14,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: SIZED_BOX_HEIGHT_27_5,
          ),
          const DottedLine(
            dashLength: 6,
            dashGapLength: 0,
            lineThickness: 2,
            dashColor: GRADIENT_END_COLOR,
            dashGapColor: Colors.transparent,
            direction: Axis.vertical,
            lineLength: 110,
          ),
          const SizedBox(
            width: SIZED_BOX_HEIGHT_27,
          ),
          Container(
            width: EVENTS_CONTAINER_WIDTH,
            height: EVENTS_CONTAINER_HEIGHT,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(EVENTS_CONTAINER_CORNER_RADIUS),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  height: EDIT_ICON_CONTAINER_WIDTH,
                  width: EDIT_ICON_CONTAINER_HEIGHT,
                  margin:
                  const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: BACKGROUND_COLOR),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      size: EDIT_ICON_SIZE,
                      color: GRADIENT_END_COLOR,
                    ),
                  ),
                ),
                const SizedBox(
                  width: SIZED_BOX_HEIGHT_10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Francisco Eiliot",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FONT_SIZE_14,
                        ),
                      ),
                      SizedBox(
                        height: SIZED_BOX_HEIGHT_5,
                      ),
                      TimeDetailTextView(
                        color: Colors.grey,
                        text: " 8:00 AM - 8:30 AM",),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DisableEventItemView extends StatelessWidget {
  final Function onTapEvent;

  const DisableEventItemView({Key? key, required this.onTapEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTapEvent();},
      child: Row(
        children: [
          Column(
            children: const [
              Text(
                "8:00",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: FONT_SIZE_14,
                ),
              ),
              SizedBox(
                height: SIZED_BOX_HEIGHT_60,
              ),
              Text(
                "8:30",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: FONT_SIZE_14,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: SIZED_BOX_HEIGHT_20,
          ),
          Column(
            children: [
              const DottedLine(
                dashLength: 6,
                dashGapLength: 10,
                lineThickness: 2,
                dashColor: GRADIENT_END_COLOR,
                dashGapColor: Colors.transparent,
                direction: Axis.vertical,
                lineLength: 110,
              ),
              Container(
                width: CIRCLE_SHAPE_CONTAINER_WIDTH,
                height: CIRCLE_SHAPE_CONTAINER_HEIGHT,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(MARGIN_SMALL),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: GRADIENT_END_COLOR, // inner circle color
                    ),
                    child: Container(), // inner content
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: SIZED_BOX_HEIGHT_20,
          ),
          Container(
            width: EVENTS_CONTAINER_WIDTH,
            height: EVENTS_CONTAINER_HEIGHT,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(EVENTS_CONTAINER_CORNER_RADIUS),
              color: DISABLE_BACKGROUND_COLOR,
            ),
            child: Row(
              children: [
                Container(
                  height: EDIT_ICON_CONTAINER_WIDTH,
                  width: EDIT_ICON_CONTAINER_HEIGHT,
                  margin:
                  const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: BACKGROUND_COLOR),
                  child: const Center(
                    child: Icon(
                      Icons.edit,
                      size: EDIT_ICON_SIZE,
                      color: DISABLE_BACKGROUND_COLOR,
                    ),
                  ),
                ),
                const SizedBox(
                  width: SIZED_BOX_HEIGHT_10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Francisco Eiliot",
                        style: TextStyle(
                          color: DISABLE_TEXT_COLOR,
                          fontSize: FONT_SIZE_14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TimeDetailTextView(
                        color: DISABLE_TEXT_COLOR,
                        text: " 8:00 AM - 8:30 AM",),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}