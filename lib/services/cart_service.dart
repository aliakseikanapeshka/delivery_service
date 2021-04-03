import 'dart:async';

import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';

class CartService {
  RestaurantModel _restaurantModel;
  Map<DishModel, int> _dishAndCountMap = {};

  // ignore: close_sinks
  final _controller = StreamController<int>();

  Stream<int> get dishCountStream => _controller.stream;

  double get cartPrice {
    double totalPrice = 0;

    _dishAndCountMap.forEach((key, value) {
      totalPrice += key.price.value * value;
    });

    return totalPrice;
  }

  Map<DishModel, int> get dishAndCountMap => Map.from(_dishAndCountMap);

  RestaurantModel get restaurantModel => _restaurantModel;

  set restaurantModel(RestaurantModel model) {
    _restaurantModel = model;
    _dishAndCountMap.clear();
    _notify();
  }

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

  incrementDishCount(DishModel dishModel) {
    if (_dishAndCountMap.containsKey(dishModel)) {
      var currentCount = _dishAndCountMap[dishModel];
      _dishAndCountMap[dishModel] = currentCount + 1;
    }
    _notify();
  }

  decrementDishCount(DishModel dishModel) {
    if (_dishAndCountMap.containsKey(dishModel)) {
      var currentCount = _dishAndCountMap[dishModel];

      if (currentCount > 1) {
        _dishAndCountMap[dishModel] = currentCount - 1;
      } else {
        removeDish(dishModel);
      }
    }

    if (_dishAndCountMap.isEmpty) {
      _restaurantModel = null;
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
    _controller.sink.add(_dishAndCountMap.length);
  }
}
