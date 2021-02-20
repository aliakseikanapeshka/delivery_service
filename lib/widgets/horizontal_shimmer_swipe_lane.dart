import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shimmer_content.dart';

class HorizontalShimmerSwipeLane extends StatelessWidget {
  final int itemCount;
  final double viewportFraction;
  final double height;
  final double elevation;
  final double borderRadius;

  HorizontalShimmerSwipeLane({
    this.itemCount = 3,
    this.viewportFraction = 0.92,
    this.height = 200,
    this.elevation = 0.8,
    this.borderRadius = Radiuses.big_1x,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: viewportFraction),
        itemCount: itemCount,
        itemBuilder: (_, i) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: BrandingColors.background,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ShimmerContent(),
          );
        },
      ),
    );
  }
}
