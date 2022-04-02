import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderListView extends StatelessWidget {
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  final double carouselSliderHeight;

  const CarouselSliderListView({Key? key, required this.itemCount, required this.itemBuilder, required this.carouselSliderHeight,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      options: CarouselOptions(
        height: carouselSliderHeight,
        enlargeCenterPage: true,
        initialPage: 1,
        reverse: false,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
