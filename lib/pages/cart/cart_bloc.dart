import 'dart:async';

import 'package:delivery_service/data/models/cart_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class CartEvent extends BaseEvent {
  const CartEvent();

  factory CartEvent.empty() = _EmptyEvent;
}

class _EmptyEvent extends CartEvent {}

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
    if (event is _EmptyEvent) {
      yield BaseState.success();
    }
  }

  @override
  Future close() async {
    await dishCountSubscription?.cancel();
    await super.close();
  }
}
