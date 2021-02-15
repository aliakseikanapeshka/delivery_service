import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/shell/shell_bloc.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';

Future<Widget> bootstrapApp() async {
  final localizationDelegate = await LocalizationDelegate.create(
    basePath: localizedAssetsPath,
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US'],
  );

  final GetIt getIt = GetIt.instance;
  _registerServices(getIt);
  _registerBlocs(getIt);

  return LocalizedApp(localizationDelegate, App(getIt.allReady()));
}

void _registerServices(GetIt getIt) {
  getIt.registerLazySingleton(() => NavigationService());
}

void _registerBlocs(GetIt getIt) {
  getIt.registerFactory(() => ShellBloc());
}
