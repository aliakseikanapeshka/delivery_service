import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';

class OrderEvent extends BaseEvent {
  const OrderEvent();

  factory OrderEvent.findOrderStatus() = _MakeOrderEvent;
}

class _MakeOrderEvent extends OrderEvent {}

class OrderBloc extends BaseBloc {
  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _MakeOrderEvent) {}
  }

  @override
  Future close() async {
    await super.close();
  }
}
