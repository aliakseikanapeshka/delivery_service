import 'dart:async';

import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/services/registry_service.dart';

class HomeEvent extends BaseEvent {
  const HomeEvent();

  factory HomeEvent.navigateToRestaurantDetail(
      RestaurantModel restaurantModel) = _NavigateToRestaurantDetailPage;
}

class _NavigateToRestaurantDetailPage extends HomeEvent {
  final RestaurantModel restaurantModel;

  _NavigateToRestaurantDetailPage(this.restaurantModel);
}

class HomeBloc extends BaseBloc {
  List<PromoModel> get promosList => List.from(_promosList);

  List<RestaurantModel> get popularList => List.from(_popularList);

  List<RestaurantModel> get restaurantsList => List.from(_restaurantsList);

  List<PromoModel> _promosList = [];
  List<RestaurantModel> _popularList = [];
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
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _NavigateToRestaurantDetailPage) {
      navigationService.navigateTo(
        Pages.restaurantDetail,
        arguments: event.restaurantModel,
      );
    }
  }

  @override
  Future close() async {
    await super.close();
  }
}
