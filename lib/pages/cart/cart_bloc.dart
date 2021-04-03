import 'dart:async';

import 'package:delivery_service/data/models/cart_model.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class CartEvent extends BaseEvent {
  const CartEvent();

  factory CartEvent.removeDish(DishModel dishModel) = _RemoveDishEvent;

  factory CartEvent.updateDishCount(DishModel dishModel, int count) =
      _UpdateDishCountEvent;
}

class _RemoveDishEvent extends CartEvent {
  final DishModel dishModel;

  _RemoveDishEvent(this.dishModel);
}

class _UpdateDishCountEvent extends CartEvent {
  final DishModel dishModel;
  final int count;

  _UpdateDishCountEvent(
    this.dishModel,
    this.count,
  );
}

class CartBloc extends BaseBloc {
  StreamSubscription dishCountSubscription;

  RestaurantModel get restaurantModel => cartService.restaurantModel;

  List<CartModel> get cartItems => List.from(_cartItems);

  List<CartModel> _cartItems = [];

  @override
  Stream<BaseState> initialize() async* {
    _updateData();
    yield BaseState.success();

    dishCountSubscription = cartService.dishCountStream.listen(
      (event) => add(BaseEvent.refresh()),
    );
  }

  @override
  Stream<BaseState> refresh() async* {
    _updateData();
    yield BaseState.success();
  }

  _updateData() {
    _cartItems.clear();

    cartService.dishAndCountMap.forEach((key, value) {
      _cartItems.add(
        CartModel(
          dishModel: key,
          count: value,
        ),
      );
    });
  }

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _RemoveDishEvent) {
      cartService.removeDish(event.dishModel);
      _updateData();
      yield BaseState.success();
    } else if (event is _UpdateDishCountEvent) {
      cartService.updateDishCount(event.dishModel, event.count);
      _updateData();
      yield BaseState.success();
    }
  }

  @override
  Future close() async {
    await dishCountSubscription?.cancel();
    await super.close();
  }
}
