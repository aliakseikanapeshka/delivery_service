import 'package:delivery_service/data/repositories/interfaces/account_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/cart_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/favorites_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/promo_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';

TextTheme get textTheme => Theme.of(Get.context).textTheme;

NavigationService _navigationService;
HomeRepository _homeRepository;
PromoRepository _promoRepository;
CartRepository _cartRepository;
FavoritesRepository _favoritesRepository;
AccountRepository _accountRepository;

NavigationService get navigationService =>
    _navigationService ??= GetIt.I.get<NavigationService>();

HomeRepository get homeRepository =>
    _homeRepository ??= GetIt.I.get<HomeRepository>();

PromoRepository get promoRepository =>
    _promoRepository ??= GetIt.I.get<PromoRepository>();

CartRepository get cartRepository =>
    _cartRepository ??= GetIt.I.get<CartRepository>();

FavoritesRepository get favoritesRepository =>
    _favoritesRepository ??= GetIt.I.get<FavoritesRepository>();

AccountRepository get accountRepository =>
    _accountRepository ??= GetIt.I.get<AccountRepository>();
