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

  HorizontalSwipeLane({
    @required this.items,
    @required this.childWidgetBuilder,
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
        itemCount: items.length,
        itemBuilder: (_, i) => childWidgetBuilder(
          context,
          items[i],
        ),
      ),
    );
  }
}
