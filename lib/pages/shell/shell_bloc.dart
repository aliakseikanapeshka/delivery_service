import 'dart:async';

import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/services/registry_service.dart';

class ShellEvent extends BaseEvent {
  const ShellEvent();

  factory ShellEvent.selectPage(Pages page) = _SelectPageEvent;

  factory ShellEvent.setNotificationCount(Pages page, int count) =
      _SetNotificationCountEvent;
}

class _SelectPageEvent extends ShellEvent {
  final Pages page;

  _SelectPageEvent(this.page);
}

class _SetNotificationCountEvent extends ShellEvent {
  final Pages page;
  final int count;

  _SetNotificationCountEvent(
    this.page,
    this.count,
  );
}

class ShellBloc extends BaseBloc {
  final List<Pages> pages = [
    Pages.home,
    Pages.promo,
    Pages.cart,
    Pages.orderStatus,
    Pages.account,
  ];

  StreamSubscription dishCountSubscription;

  final Map<Pages, int> pageNotificationCounts = {};

  Pages selectedPage = Pages.home;

  int get selectedItemIndex => pages.indexOf(selectedPage);

  @override
  Stream<BaseState> initialize() async* {
    yield BaseState.success();

    dishCountSubscription = cartService.dishCountStream.listen(
      (count) => add(ShellEvent.setNotificationCount(Pages.cart, count)),
    );
  }

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _SelectPageEvent) {
      selectedPage = event.page;
      yield SuccessState();
    } else if (event is _SetNotificationCountEvent) {
      pageNotificationCounts[event.page] = event.count;
      yield SuccessState();
    }
  }

  @override
  Future close() async {
    await dishCountSubscription?.cancel();
    await super.close();
  }
}
