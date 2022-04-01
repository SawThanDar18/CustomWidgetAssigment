import 'package:carousel_slider/carousel_controller.dart';
import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:custom_widget_assignment/widgets/carousel_slider_list_view.dart';
import 'package:custom_widget_assignment/widgets/gradient_view.dart';
import 'package:custom_widget_assignment/widgets/time_detail_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_grey_text_view.dart';
import 'package:custom_widget_assignment/widgets/white_text_view.dart';
import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class EventCarouselSliderView extends StatelessWidget {
  const EventCarouselSliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CarouselSliderListView(
        itemCount: 10,
        carouselSliderHeight: EVENT_CAROUSEL_SLIDER_HEIGHT,
        itemBuilder: (context, index, pageIndex) {
          return const EventCarouselSliderItemView();
        },
    );
  }
}

class EventCarouselSliderItemView extends StatelessWidget {
  const EventCarouselSliderItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: CONTAINER_LINE_WIDTH,
          color: BLUE_LIGHT_COLOR,
        ),
        Container(
          width: CAROUSEL_DATA_CONTAINER_WIDTH,
          color: Colors.black,
          child: Stack(
            children: [
              const Positioned.fill(
                child: GradientView(),
              ),
              Container(
                margin: const EdgeInsets.only(top: MARGIN_TEN, left: MARGIN_MEDIUM),
                child: Column(
                  children: const [
                    OfficeDetailTextView(),
                    SizedBox(
                      height: SIZED_BOX_HEIGHT_6,
                    ),
                    TimeDetailTextView(),
                    SizedBox(
                      height: SIZED_BOX_HEIGHT_6,
                    ),
                    PatientListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PatientListView extends StatelessWidget {
  const PatientListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: SIZED_BOX_HEIGHT_40,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: CIRCLE_IMAGE_WIDTH,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                      AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Center(
          child: Container(
            width: CIRCLE_IMAGE_WIDTH,
            height: CIRCLE_IMAGE_HEIGHT,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.check_circle_sharp,
              size: CAROUSEL_CHECK_ICON_SIZE,
              color: BLUE_LIGHT_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}

class OfficeDetailTextView extends StatelessWidget {
  const OfficeDetailTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        WhiteTextView(text: "Office No.248", fontSize: FONT_SIZE_16),
        WhiteGreyTextView(text: "/ 3 patients", textSize: FONT_SIZE_14),
      ],
    );
  }
}
