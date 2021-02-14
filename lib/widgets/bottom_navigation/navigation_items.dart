import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'bottom_navigation_item_model.dart';

final Map<Pages, BottomNavigationItemModel> bottomNavigationItems = {
  Pages.home: BottomNavigationItemModel(
    assetsIconPath: Assets.example,
    title: translate(LocalizationKeys.Shell_Home),
  ),
  Pages.account: BottomNavigationItemModel(
    icon: Icons.account_circle_outlined,
    title: translate(LocalizationKeys.Shell_Account),
  ),
};
