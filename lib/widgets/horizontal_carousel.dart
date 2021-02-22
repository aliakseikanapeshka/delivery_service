import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef LaneChildBuilder<Model> = Widget Function(
  BuildContext context,
  Model model,
);

class HorizontalCarousel<T> extends StatelessWidget {
  final List<T> items;
  final LaneChildBuilder<T> childWidgetBuilder;
  final double viewportFraction;
  final double height;

  HorizontalCarousel({
    @required this.items,
    @required this.childWidgetBuilder,
    this.viewportFraction = 0.70,
    this.height = 156,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        aspectRatio: 2.4,
        autoPlayInterval: Duration(seconds: 5),
        autoPlay: true,
        viewportFraction: viewportFraction,
      ),
      itemBuilder: (context, index, realIndex) => childWidgetBuilder(
        context,
        items[index],
      ),
    );
  }
}
