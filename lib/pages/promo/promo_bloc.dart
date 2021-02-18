import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';

class PromoEvent extends BaseEvent {
  const PromoEvent();

  factory PromoEvent.empty() = _EmptyEvent;
}

class _EmptyEvent extends PromoEvent {}

class PromoBloc extends BaseBloc {
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
