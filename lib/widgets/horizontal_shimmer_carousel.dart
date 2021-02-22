import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalShimmerCarousel extends StatelessWidget {
  final int itemCount;
  final double viewportFraction;
  final double height;

  HorizontalShimmerCarousel({
    this.itemCount = 3,
    this.viewportFraction = 0.70,
    this.height = 156,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        aspectRatio: 2.4,
        viewportFraction: viewportFraction,
      ),
      itemBuilder: (_, _i, _ri) => ShimmerCard(),
    );
  }
}
