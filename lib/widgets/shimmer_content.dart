import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/app/theme/radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Shimmer.fromColors(
          baseColor: BrandingColors.shimmerBackground,
          highlightColor: BrandingColors.shimmerBackgroundHighlight,
          child: Container(color: Colors.white),
        ),
        Shimmer.fromColors(
          baseColor: BrandingColors.shimmerContent,
          highlightColor: BrandingColors.shimmerContentHighlight,
          child: Padding(
            padding: EdgeInsets.all(Insets.x4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 130,
                  decoration: _buildShimmerLineDecoration(),
                ),
                SizedBox(height: Insets.x1_5),
                Container(
                  height: 12,
                  width: 180,
                  decoration: _buildShimmerLineDecoration(),
                ),
                SizedBox(height: Insets.x1_5),
                Container(
                  height: 12,
                  width: 90,
                  decoration: _buildShimmerLineDecoration(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Decoration _buildShimmerLineDecoration() => BoxDecoration(
        color: BrandingColors.shimmerContent,
        borderRadius: BorderRadius.all(
          Radius.circular(Radiuses.small_3x),
        ),
      );
}
