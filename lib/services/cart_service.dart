import 'dart:async';

import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';

class CartService {
  RestaurantModel get restaurantModel => _restaurantModel;

  set restaurantModel(RestaurantModel model) {
    _restaurantModel = model;
    _dishAndCountMap.clear();
    _notify();
  }

  Map<DishModel, int> get dishAndCountMap => Map.from(_dishAndCountMap);

  Stream<int> get dishCountStream => _dishCountController.stream;

  double get totalCartPrice => _totalCartPrice;

  // ignore: close_sinks
  final _dishCountController = StreamController<int>.broadcast();
  RestaurantModel _restaurantModel;
  double _totalCartPrice = 0;
  final Map<DishModel, int> _dishAndCountMap = {};

  addDish(DishModel dishModel, int count) {
    if (_restaurantModel == null) {
      return;
    }

    if (_dishAndCountMap.containsKey(dishModel)) {
      var currentCount = _dishAndCountMap[dishModel];
      _dishAndCountMap[dishModel] = currentCount + count;
    } else {
      _dishAndCountMap[dishModel] = count;
    }

    _notify();
  }

  updateDishCount(DishModel dishModel, int count) {
    if (_dishAndCountMap.containsKey(dishModel)) {
      _dishAndCountMap[dishModel] = count;
    }

    _notify();
  }

  removeDish(DishModel dishModel) {
    _dishAndCountMap.remove(dishModel);

    if (_dishAndCountMap.isEmpty) {
      _restaurantModel = null;
    }

    _notify();
  }

  clear() {
    _restaurantModel = null;
    _dishAndCountMap.clear();

    _notify();
  }

  _notify() {
    double sumPrice = 0;

    dishAndCountMap.forEach((key, value) {
      sumPrice += value * key.price;
    });

    _totalCartPrice = sumPrice;

    _dishCountController.sink.add(_dishAndCountMap.length);
  }
}
