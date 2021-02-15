import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/navigation_service.dart';

class ShellEvent extends BaseEvent {
  const ShellEvent();

  factory ShellEvent.selectPage(Pages page) = _SelectPageEvent;
}

class _SelectPageEvent extends ShellEvent {
  final Pages page;

  _SelectPageEvent(this.page);
}

class ShellBloc extends BaseBloc {
  final List<Pages> pages = [
    Pages.home,
    Pages.promo,
    Pages.cart,
    Pages.favorite,
    Pages.account,
  ];

  Pages selectedPage = Pages.home;

  int get selectedItemIndex => pages.indexOf(selectedPage);

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _SelectPageEvent) {
      selectedPage = event.page;
      yield SuccessState();
    }
  }
}
