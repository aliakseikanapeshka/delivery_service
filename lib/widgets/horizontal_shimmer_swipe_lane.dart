import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalShimmerSwipeLane extends StatelessWidget {
  final int itemCount;
  final double viewportFraction;
  final double height;

  HorizontalShimmerSwipeLane({
    this.itemCount = 3,
    this.viewportFraction = 0.92,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: viewportFraction),
        itemCount: itemCount,
        itemBuilder: (_, i) => ShimmerCard(),
      ),
    );
  }
}
