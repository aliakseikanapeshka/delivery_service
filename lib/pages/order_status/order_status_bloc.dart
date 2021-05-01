import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_service/data/models/OrderStatus.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';

class OrderStatusEvent extends BaseEvent {
  const OrderStatusEvent();

  factory OrderStatusEvent.findOrderStatus() = _FindOrderStatusEvent;

  factory OrderStatusEvent.updateOrderId(String orderId) = _UpdateOrderIdEvent;
}

class _FindOrderStatusEvent extends OrderStatusEvent {}

class _UpdateOrderIdEvent extends OrderStatusEvent {
  final String orderId;

  const _UpdateOrderIdEvent(
    this.orderId,
  );
}

class OrderStatusBloc extends BaseBloc {
  String _orderId = "";

  OrderStatus orderStatus;

  StreamSubscription<DocumentSnapshot> _orderSubscription;

  @override
  Stream<BaseState> handleEvent(BaseEvent event) async* {
    if (event is _UpdateOrderIdEvent) {
      _orderId = event.orderId;
    } else if (event is _FindOrderStatusEvent) {
      await _orderSubscription?.cancel();

      try {
        _orderSubscription = FirebaseFirestore.instance
            .collection("orders")
            .doc(_orderId)
            .snapshots()
            .listen(
          (docSnapshot) {
            try {
              orderStatus = mapStringToOrderStatus(docSnapshot["status"]);
              emit(BaseState.success());
            } catch (e) {
              orderStatus = OrderStatus.unknown;
              emit(BaseState.success());
            }
          },
        );
      } catch (e) {
        print(e);
        orderStatus = OrderStatus.unknown;
        yield BaseState.success();
      }
    }
  }

  @override
  Future close() async {
    await _orderSubscription?.cancel();
    await super.close();
  }
}

OrderStatus mapStringToOrderStatus(String status) {
  switch (status) {
    case "processing":
      return OrderStatus.processing;
    case "cooking":
      return OrderStatus.cooking;
    case "delivering":
      return OrderStatus.delivering;
    case "done":
      return OrderStatus.done;
    default:
      return OrderStatus.unknown;
  }
}
