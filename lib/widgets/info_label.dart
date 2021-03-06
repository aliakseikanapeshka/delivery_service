import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
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
    this.color = BrandingColors.infoLabelDefault,
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
        padding: const EdgeInsets.all(Insets.x2),
        child: Text(
          text,
          style: textTheme.subtitle1,
        ),
      ),
    );
  }
}
