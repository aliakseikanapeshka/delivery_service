import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_service/data/models/order_model.dart';
import 'package:delivery_service/data/repositories/interfaces/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<String> makeOrder(OrderModel orderModel) async {
    try {
      final newDocReference =
          await FirebaseFirestore.instance.collection("orders").add({
        "address": orderModel.address,
        "comment": orderModel.comment,
        "email": orderModel.email,
        "name": orderModel.name,
        "paymentType": orderModel.paymentType,
        "personsCount": orderModel.persons,
        "phone": orderModel.phone,
        "promoCode": orderModel.promoCode,
        "restaurantId": orderModel.restaurantId,
        "status": "processing",
      });

      orderModel.orderedPositions.forEach((key, value) {
        newDocReference.collection("orderedPositions").add({
          "count": value,
          "dishId": key,
        });
      });

      return newDocReference.id;
    } catch (e) {
      print(e);
      return "";
    }
  }
}
