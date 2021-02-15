import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';

TextTheme get textTheme => Theme.of(Get.context).textTheme;

NavigationService _navigationService;

NavigationService get navigationService =>
    _navigationService ??= GetIt.I.get<NavigationService>();
