import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_item_icon.dart';
import 'navigation_items.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Iterable<Pages> pages;
  final int selectedIndex;
  final Function(Pages) onTappedFunction;

  const BottomNavigationWidget({
    @required this.pages,
    @required this.selectedIndex,
    @required this.onTappedFunction,
  });

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: BrandingColors.background,
      items: _createBottomNavigationBarItems(),
      unselectedItemColor: BrandingColors.primaryText,
      selectedItemColor: BrandingColors.primary,
      currentIndex: widget.selectedIndex,
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
      iconSize: 26.0,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => widget.onTappedFunction(widget.pages.elementAt(index)),
    );
  }

  List<BottomNavigationBarItem> _createBottomNavigationBarItems() {
    return widget.pages
        .map(
          (page) => BottomNavigationBarItem(
            icon: BottomBarItemIcon(
              iconData: bottomNavigationItems[page].icon,
              assetsIconPath: bottomNavigationItems[page].assetsIconPath,
            ),
            title: Text(bottomNavigationItems[page].title),
          ),
        )
        .toList();
  }
}
