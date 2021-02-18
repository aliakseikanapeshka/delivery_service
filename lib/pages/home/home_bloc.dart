import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';

class HomeEvent extends BaseEvent {
  const HomeEvent();

  factory HomeEvent.empty() = _EmptyEvent;
}

class _EmptyEvent extends HomeEvent {}

class HomeBloc extends BaseBloc {
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
