import 'package:delivery_service/data/repositories/interfaces/account_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/cart_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/favorites_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/promo_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/restaurant_repository.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_account_repository_impl.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_cart_repository_impl.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_favorites_repository_impl.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_home_repository_impl.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_promo_repository_impl.dart';
import 'package:delivery_service/data/repositories/mock_impl/mock_restaurant_repository_impl.dart';
import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/account/account_bloc.dart';
import 'package:delivery_service/pages/cart/cart_bloc.dart';
import 'package:delivery_service/pages/favorites/favorites_bloc.dart';
import 'package:delivery_service/pages/home/home_bloc.dart';
import 'package:delivery_service/pages/promo/promo_bloc.dart';
import 'package:delivery_service/pages/restaurant_detail/restaurant_detail_bloc.dart';
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
  _registerRepositories(getIt);
  _registerServices(getIt);
  _registerBlocs(getIt);

  return LocalizedApp(localizationDelegate, App(getIt.allReady()));
}

void _registerServices(GetIt getIt) {
  getIt.registerLazySingleton(() => NavigationService());
}

void _registerRepositories(GetIt getIt) {
  getIt.registerLazySingleton<RestaurantRepository>(
      () => MockRestaurantRepositoryImpl());
  getIt.registerLazySingleton<HomeRepository>(() => MockHomeRepositoryImpl());
  getIt.registerLazySingleton<PromoRepository>(() => MockPromoRepositoryImpl());
  getIt.registerLazySingleton<CartRepository>(() => MockCartRepositoryImpl());
  getIt.registerLazySingleton<FavoritesRepository>(
      () => MockFavoritesRepositoryImpl());
  getIt.registerLazySingleton<AccountRepository>(
      () => MockAccountRepositoryImpl());
}

void _registerBlocs(GetIt getIt) {
  getIt.registerFactory(() => ShellBloc());
  getIt.registerFactory(() => HomeBloc());
  getIt.registerFactory(() => PromoBloc());
  getIt.registerFactory(() => CartBloc());
  getIt.registerFactory(() => FavoritesBloc());
  getIt.registerFactory(() => AccountBloc());
  getIt.registerFactory(() => RestaurantDetailBloc());
}
