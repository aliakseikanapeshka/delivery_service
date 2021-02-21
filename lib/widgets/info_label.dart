import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color color;

  InfoLabel({
    this.text,
    this.borderRadius = Radiuses.big_2x,
    this.color = const Color(0xFFF5F5F5), //grey[100]
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.x1_5),
        child: Text(
          text,
          style: textTheme.subtitle2,
        ),
      ),
    );
  }
}
