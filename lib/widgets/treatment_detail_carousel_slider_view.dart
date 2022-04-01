import 'package:custom_widget_assignment/resources/dimens.dart';
import 'package:custom_widget_assignment/widgets/black_text_view.dart';
import 'package:custom_widget_assignment/widgets/time_detail_text_view.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/strings.dart';
import 'carousel_slider_list_view.dart';

class TreatmentDetailSliderView extends StatelessWidget {
  const TreatmentDetailSliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CarouselSliderListView(
      itemCount: 10,
      carouselSliderHeight: TREATMENT_CAROUSEL_SLIDER_HEIGHT,
      itemBuilder: (context, index, pageIndex) {
        return const TreatmentDetailCarouselSliderItemView(
        );
      },
    );
  }
}

class TreatmentDetailCarouselSliderItemView extends StatelessWidget {
  const TreatmentDetailCarouselSliderItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        margin: const EdgeInsets.all(MARGIN_LARGE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TimeDetailTextView(color: Colors.grey,),
                ConfirmedButtonView(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: MARGIN_SMALL),
              child: const BlackTextView(text: "Teeth Drilling", fontSize: FONT_SIZE_18),
            ),
            Container(
              margin: const EdgeInsets.only(left: MARGIN_SIX, top: MARGIN_SMALL),
              child: const Text(
                "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: FONT_SIZE_12,
                ),
                ),
            ),
            Container(
              margin: const EdgeInsets.only(left: MARGIN_SIX, top: MARGIN_SMALL),
              child: const DoctorProfileView(),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: DOCTOR_IMAGE_CIRCULAR_WIDTH,
          height: DOCTOR_IMAGE_CIRCULAR_HEIGHT,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: SIZED_BOX_HEIGHT_10,
        ),
        const BlackTextView(text: "Arthur Clayton", fontSize: FONT_SIZE_14),
      ],
    );
  }
}

class ConfirmedButtonView extends StatelessWidget {
  const ConfirmedButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CONFIRMED_BUTTON_CONTAINER_WIDTH,
      height: CONFIRMED_BUTTON_CONTAINER_HEIGHT,
      decoration: const BoxDecoration(
        color: GREEN_BACKGROUND_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(CONFIRMED_BUTTON_BORDER_RADIUS)),
      ),
      child: Center(
        child: Text(
          CONFIRMED_TEXT,
          style: TextStyle(
            color: GREEN_TEXT_COLOR,
          ),
        ),
      ),
    );
  }
}


