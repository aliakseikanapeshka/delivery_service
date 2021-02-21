import 'package:flutter_bloc/flutter_bloc.dart';

class BaseEvent {
  const BaseEvent();

  factory BaseEvent._init() = _InitEvent;

  factory BaseEvent.refresh() = _RefreshEvent;
}

class _InitEvent extends BaseEvent {}

class _RefreshEvent extends BaseEvent {}

class BaseState {
  const BaseState();

  factory BaseState.initial() = InitialState;

  factory BaseState.progress() = ProgressState;

  factory BaseState.success() = SuccessState;

  factory BaseState.error() = ErrorState;
}

class InitialState extends BaseState {}

class ProgressState extends BaseState {}

class SuccessState extends BaseState {}

class ErrorState extends BaseState {}

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseState.initial()) {
    add(BaseEvent._init());
  }

  Stream<BaseState> initialize() async* {}

  Stream<BaseState> handleEvent(BaseEvent event) async* {}

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is _InitEvent) {
      yield* initialize();
    } else if (event is _RefreshEvent) {
      yield BaseState.initial();
      yield* initialize();
    } else {
      yield* handleEvent(event);
    }
  }
}
