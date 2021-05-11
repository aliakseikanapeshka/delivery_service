import 'package:delivery_service/data/models/order_model.dart';

abstract class OrderRepository {
  Future<String> makeOrder(OrderModel orderModel);
}
