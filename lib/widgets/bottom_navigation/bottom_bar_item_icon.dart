import 'package:badges/badges.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icon_with_badge.dart';

class BottomBarItemIcon extends StatelessWidget {
  final IconData iconData;
  final String assetsIconPath;
  final bool hasBadge;
  final int badgeValue;

  static const _iconWithBadgeWidth = 41.0;

  const BottomBarItemIcon({
    this.iconData,
    this.assetsIconPath,
    this.hasBadge = false,
    this.badgeValue,
  }) : assert(iconData != null || assetsIconPath != null);

  @override
  Widget build(BuildContext context) {
    if (hasBadge) {
      return Container(
        alignment: Alignment.center,
        width: _iconWithBadgeWidth,
        child: IconWithBadge(
          badgePosition: BadgePosition.bottomEnd(bottom: 10, end: -16),
          badgeTextStyle: textTheme.overline,
          icon: _buildIcon(context),
          badgeValue: badgeValue,
        ),
      );
    } else {
      return _buildIcon(context);
    }
  }

  Widget _buildIcon(BuildContext context) {
    if (assetsIconPath != null) {
      return SvgPicture.asset(
        assetsIconPath,
        height: 24,
        width: 24,
        color: IconTheme.of(context).color,
      );
    } else {
      return Icon(iconData);
    }
  }
}
