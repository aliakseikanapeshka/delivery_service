import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef LaneChildBuilder<Model> = Widget Function(
  BuildContext context,
  Model model,
);

class HorizontalSwipeLane<T> extends StatelessWidget {
  final List<T> items;
  final LaneChildBuilder<T> childWidgetBuilder;
  final double viewportFraction;
  final double height;
  final double elevation;
  final double borderRadius;

  HorizontalSwipeLane({
    @required this.items,
    @required this.childWidgetBuilder,
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
        itemCount: items.length,
        itemBuilder: (_, i) {
          return Card(
            shadowColor: BrandingColors.background,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: childWidgetBuilder(
              context,
              items[i],
            ),
          );
        },
      ),
    );
  }
}
