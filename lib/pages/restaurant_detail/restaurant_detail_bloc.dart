import 'dart:async';

import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class RestaurantEvent extends BaseEvent {
  const RestaurantEvent();

  factory RestaurantEvent.setInitialData(RestaurantModel model) =
      _SetInitialDataEvent;
}

class _SetInitialDataEvent extends RestaurantEvent {
  final RestaurantModel model;

  _SetInitialDataEvent(this.model);
}

class RestaurantDetailBloc extends BaseBloc {
  List<DishModel> get dishList => List.from(_dishList);

  List<DishModel> _dishList = [];

  RestaurantModel _restaurantModel;

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _SetInitialDataEvent) {
      _restaurantModel = event.model;
      yield BaseState.progress();
      _dishList = await restaurantRepository.getDishList(_restaurantModel.id);
      yield BaseState.success();
    }
  }

  @override
  Future close() async {
    await super.close();
  }
}
