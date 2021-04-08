import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/radiuses.dart';
import 'package:delivery_service/widgets/shimmer_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  final double elevation;
  final double borderRadius;

  ShimmerCard({
    this.elevation = 0.8,
    this.borderRadius = Radiuses.big_1x,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: BrandingColors.background,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ShimmerContent(),
    );
  }
}
