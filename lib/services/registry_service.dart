import 'package:delivery_service/data/repositories/interfaces/account_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/cart_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/favorites_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/promo_repository.dart';
import 'package:delivery_service/data/repositories/interfaces/restaurant_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'cart_service.dart';
import 'navigation_service.dart';

TextTheme get textTheme => Theme.of(Get.context).textTheme;

NavigationService _navigationService;
CartService _cartService;
RestaurantRepository _restaurantRepository;
HomeRepository _homeRepository;
PromoRepository _promoRepository;
CartRepository _cartRepository;
FavoritesRepository _favoritesRepository;
AccountRepository _accountRepository;

CartService get cartService => _cartService ??= GetIt.I.get<CartService>();

NavigationService get navigationService =>
    _navigationService ??= GetIt.I.get<NavigationService>();

RestaurantRepository get restaurantRepository =>
    _restaurantRepository ??= GetIt.I.get<RestaurantRepository>();

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
