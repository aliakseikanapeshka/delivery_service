import 'package:delivery_service/services/shell_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';

TextTheme get textTheme => Theme.of(Get.context).textTheme;

NavigationService _navigationService;
ShellService _shellService;

NavigationService get navigationService =>
    _navigationService ??= GetIt.I.get<NavigationService>();

ShellService get shellService => _shellService ??= GetIt.I.get<ShellService>();
