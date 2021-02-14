import 'package:delivery_service/pages/shell/shell_page.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey mainGlobalKey = GlobalKey();

enum Pages {
  home,
  account,
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = Get.key;

  Future<dynamic> navigateTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.push(route);
  }

  Future<dynamic> navigateWithReplacementTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.pushReplacement(route);
  }

  void goBackToShell({Pages page = Pages.home}) {
    navigatorKey.currentState.popUntil((Route<dynamic> route) {
      return route.isFirst;
    });

    changeShellTab(page);
  }

  void changeShellTab(Pages page) => shellService.changeShellTab(page);

  void goBack<T extends Object>({T result}) {
    navigatorKey.currentState.pop<T>(result);
  }

  Route<dynamic> _generateRoute(Pages page, Object arguments) {
    Widget resultPage;

    switch (page) {
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
