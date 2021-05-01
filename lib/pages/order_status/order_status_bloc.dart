import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';

class OrderStatusEvent extends BaseEvent {
  const OrderStatusEvent();

  factory OrderStatusEvent.empty() = _EmptyEvent;
}

class _EmptyEvent extends OrderStatusEvent {}

class OrderStatusBloc extends BaseBloc {
  @override
  Stream<BaseState> initialize() async* {
    yield BaseState.success();
  }

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _EmptyEvent) {
      yield BaseState.success();
    }
  }

  @override
  Future close() async {
    await super.close();
  }
}
