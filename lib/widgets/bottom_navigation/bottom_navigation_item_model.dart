import 'package:flutter/material.dart';

class BottomNavigationItemModel {
  final IconData icon;
  final String assetsIconPath;
  final String title;

  BottomNavigationItemModel({
    this.icon,
    this.assetsIconPath,
    @required this.title,
  }) : assert(icon != null || assetsIconPath != null);
}
