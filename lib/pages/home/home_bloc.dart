import 'dart:async';

import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class HomeBloc extends BaseBloc {
  List<PromoModel> get promosList => List.from(_promosList);

  List<FavoriteModel> get favoritesList => List.from(_favoritesList);

  List<RestaurantModel> get restaurantsList => List.from(_restaurantsList);

  List<PromoModel> _promosList = [];
  List<FavoriteModel> _favoritesList = [];
  List<RestaurantModel> _restaurantsList = [];

  @override
  Stream<BaseState> initialize() async* {
    await Future.wait<void>([
      homeRepository.getPromosList().then((result) => _promosList = result),
      homeRepository
          .getFavoritesList()
          .then((result) => _favoritesList = result),
      homeRepository
          .getRestaurantsList()
          .then((result) => _restaurantsList = result),
    ]);

    yield BaseState.success();
  }

  @override
  Future close() async {
    await super.close();
  }
}
