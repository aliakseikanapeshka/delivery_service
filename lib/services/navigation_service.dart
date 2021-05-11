import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/order_page/order_page.dart';
import 'package:delivery_service/pages/restaurant_detail/restaurant_detail_page.dart';
import 'package:delivery_service/pages/shell/shell_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey mainGlobalKey = GlobalKey();

enum Pages {
  home,
  promo,
  cart,
  favorite,
  orderStatus,
  account,
  restaurantDetail,
  order,
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = Get.key;

  navigateTo(Pages page, {Object arguments}) {
    try {
      final route = _generateRoute(page, arguments);
      navigatorKey.currentState.push(route);
    } catch (e) {
      print(e);
    }
  }

  navigateWithReplacementTo(Pages page, {Object arguments}) {
    try {
      final route = _generateRoute(page, arguments);
      navigatorKey.currentState.pushReplacement(route);
    } catch (e) {
      print(e);
    }
  }

  void goBack<T extends Object>({T result}) {
    navigatorKey.currentState.pop<T>(result);
  }

  Route<dynamic> _generateRoute(Pages page, Object arguments) {
    Widget resultPage;

    switch (page) {
      case Pages.restaurantDetail:
        if (arguments is RestaurantModel) {
          resultPage = RestaurantDetailPage(restaurantModel: arguments);
        } else {
          throw Exception(
            "cant open RestaurantDetailPage without arguments of type RestaurantModel",
          );
        }
        break;
      case Pages.order:
        resultPage = const OrderPage();
        break;
      default:
        resultPage = const ShellPage();
        break;
    }

    return _getRoute(resultPage);
  }

  Route<dynamic> _getRoute(Widget widget, {RouteSettings settings}) {
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}
