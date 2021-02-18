import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';

class AccountEvent extends BaseEvent {
  const AccountEvent();

  factory AccountEvent.empty() = _EmptyEvent;
}

class _EmptyEvent extends AccountEvent {}

class AccountBloc extends BaseBloc {
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
