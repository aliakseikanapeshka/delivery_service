import 'dart:async';

import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class HomeBloc extends BaseBloc {
  List<PromoModel> get promosList => List.from(_promosList);

  List<PopularModel> get popularList => List.from(_popularList);

  List<RestaurantModel> get restaurantsList => List.from(_restaurantsList);

  List<PromoModel> _promosList = [];
  List<PopularModel> _popularList = [];
  List<RestaurantModel> _restaurantsList = [];

  @override
  Stream<BaseState> initialize() async* {
    await Future.wait<void>([
      homeRepository.getPromosList().then((result) => _promosList = result),
      homeRepository.getPopularList().then((result) => _popularList = result),
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
