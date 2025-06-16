import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.height,
    required this.items,
    required this.onPageChanged,
  });
  final double height;

  final List<Widget> items;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.map((item) => item).toList(),
      options: CarouselOptions(
        height: height,
        //aspectRatio: 20 / 10,
        viewportFraction: 01,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        onPageChanged: onPageChanged,
        //enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
