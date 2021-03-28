import 'dart:async';

import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class RestaurantEvent extends BaseEvent {
  const RestaurantEvent();

  factory RestaurantEvent.setInitialData(RestaurantModel model) =
      _SetInitialDataEvent;

  factory RestaurantEvent.tryAddDishToCart(DishModel dishModel, int count) =
      _TryAddDishToCartEvent;

  factory RestaurantEvent.forceAddDishToCart(DishModel dishModel, int count) =
      _ForceAddDishToCartEvent;
}

class _SetInitialDataEvent extends RestaurantEvent {
  final RestaurantModel model;

  _SetInitialDataEvent(this.model);
}

class _TryAddDishToCartEvent extends RestaurantEvent {
  final DishModel dishModel;
  final int count;

  _TryAddDishToCartEvent(
    this.dishModel,
    this.count,
  );
}

class _ForceAddDishToCartEvent extends RestaurantEvent {
  final DishModel dishModel;
  final int count;

  _ForceAddDishToCartEvent(
    this.dishModel,
    this.count,
  );
}

class RestaurantState extends BaseState {
  const RestaurantState();

  factory RestaurantState.showDishAddedDialog() = ShowDishAddedDialogState;

  factory RestaurantState.showClearCartDialog(DishModel dishModel, int count) =
      ShowClearCartDialogState;
}

class ShowDishAddedDialogState extends RestaurantState {}

class ShowClearCartDialogState extends RestaurantState {
  final DishModel dishModel;
  final int count;

  ShowClearCartDialogState(
    this.dishModel,
    this.count,
  );
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
    } else if (event is _TryAddDishToCartEvent) {
      if (cartService.restaurantModel == null ||
          cartService.restaurantModel == _restaurantModel) {
        if (cartService.restaurantModel == null) {
          cartService.restaurantModel = _restaurantModel;
        }

        cartService.addDish(
          event.dishModel,
          event.count,
        );

        yield RestaurantState.showDishAddedDialog();
      } else {
        yield RestaurantState.showClearCartDialog(
          event.dishModel,
          event.count,
        );
      }
    } else if (event is _ForceAddDishToCartEvent) {
      cartService.restaurantModel = _restaurantModel;
      cartService.addDish(
        event.dishModel,
        event.count,
      );
      yield RestaurantState.showDishAddedDialog();
    }
  }

  @override
  Future close() async {
    await super.close();
  }
}
