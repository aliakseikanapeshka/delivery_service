import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/theme/assets.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'bottom_navigation_item_model.dart';

final Map<Pages, BottomNavigationItemModel> bottomNavigationItems = {
  Pages.home: BottomNavigationItemModel(
    assetsIconPath: Assets.navigation_home,
    title: translate(LocalizationKeys.Shell_Home),
  ),
  Pages.promo: BottomNavigationItemModel(
    assetsIconPath: Assets.navigation_promo,
    title: translate(LocalizationKeys.Shell_Promo),
  ),
  Pages.cart: BottomNavigationItemModel(
    assetsIconPath: Assets.navigation_cart,
    title: translate(LocalizationKeys.Shell_Cart),
  ),
  Pages.favorite: BottomNavigationItemModel(
    assetsIconPath: Assets.navigation_favorite,
    title: translate(LocalizationKeys.Shell_Favorites),
  ),
  Pages.account: BottomNavigationItemModel(
    assetsIconPath: Assets.navigation_account,
    title: translate(LocalizationKeys.Shell_Account),
  ),
};
