import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItemIcon extends StatelessWidget {
  final IconData iconData;
  final String assetsIconPath;

  const BottomBarItemIcon({
    this.iconData,
    this.assetsIconPath,
  }) : assert(iconData != null || assetsIconPath != null);

  @override
  Widget build(BuildContext context) => _buildIcon(context);

  Widget _buildIcon(BuildContext context) {
    if (assetsIconPath != null) {
      return SvgPicture.asset(
        assetsIconPath,
        height: 24,
        width: 24,
        color: IconTheme.of(context).color,
      );
    }

    return Icon(iconData);
  }
}
