import 'package:badges/badges.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:flutter/cupertino.dart';

class IconWithBadge extends Badge {
  final int badgeValue;
  final BadgePosition badgePosition;
  final Widget icon;
  final TextStyle badgeTextStyle;

  IconWithBadge({
    this.badgeValue = 0,
    this.badgePosition,
    this.badgeTextStyle,
    @required this.icon,
  }) : super(
          child: icon,
          badgeContent: Text(
            badgeValue.toString(),
            style: badgeTextStyle,
            textAlign: TextAlign.center,
          ),
          position:
              badgePosition ?? BadgePosition.bottomEnd(bottom: 10, end: -16),
          shape: BadgeShape.circle,
          elevation: 1.0,
          badgeColor: BrandingColors.primary,
          animationType: BadgeAnimationType.scale,
          showBadge: badgeValue != 0,
          padding: const EdgeInsets.fromLTRB(
            Insets.x1_5,
            Insets.x0_5,
            Insets.x1_5,
            Insets.x0_5,
          ),
        );
}
