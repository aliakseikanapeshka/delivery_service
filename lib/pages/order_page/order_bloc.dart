import 'dart:async';

import 'package:delivery_service/data/models/order_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class OrderEvent extends BaseEvent {
  const OrderEvent();

  factory OrderEvent.makeOrderEvent({
    String address,
    String comment,
    String email,
    String name,
    String paymentType,
    int persons,
    String phone,
    String promoCode,
  }) = _MakeOrderEvent;

  factory OrderEvent.closeOrderPage() = _CloseOrderPageEvent;
}

class _MakeOrderEvent extends OrderEvent {
  String address;
  String comment;
  String email;
  String name;
  String paymentType;
  int persons;
  String phone;
  String promoCode;

  _MakeOrderEvent({
    this.address,
    this.comment,
    this.email,
    this.name,
    this.paymentType,
    this.persons,
    this.phone,
    this.promoCode,
  });
}

class _CloseOrderPageEvent extends OrderEvent {}

class OrderState extends BaseState {
  const OrderState();

  factory OrderState.showOrderDoneDialog() = ShowOrderDoneDialogState;

  factory OrderState.showOrderFailedDialog() = ShowOrderFailedDialogState;
}

class ShowOrderDoneDialogState extends OrderState {}

class ShowOrderFailedDialogState extends OrderState {}

class OrderBloc extends BaseBloc {
  double get totalCartPrice => cartService.totalCartPrice;

  RestaurantModel get restaurantModel => cartService.restaurantModel;

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _MakeOrderEvent) {
      yield BaseState.progress();

      final orderModel = OrderModel(
        address: event.address,
        comment: event.comment,
        email: event.email,
        name: event.name,
        promoCode: event.promoCode,
        paymentType: event.paymentType,
        phone: event.phone,
        persons: event.persons,
        restaurantId: cartService.restaurantModel.id,
        orderedPositions: cartService.dishAndCountMap
            .map((key, value) => MapEntry(key.id, value)),
      );

      final resultId = await orderRepository.makeOrder(orderModel);

      if (resultId != null && resultId.isNotEmpty) {
        cartService.clear();
        yield OrderState.showOrderDoneDialog();
      } else {
        yield BaseState.success();
        yield OrderState.showOrderFailedDialog();
      }
    } else if (event is _CloseOrderPageEvent) {
      navigationService.goBack();
    }
  }

  @override
  Future close() async {
    await super.close();
  }
}
