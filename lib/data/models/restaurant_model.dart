import 'package:delivery_service/data/models/price_model.dart';

class RestaurantModel {
  final String id;
  final String imageUrl;
  final String name;
  final String minOrderPrice;
  final String deliveryPrice;
  final String deliveryTime;
  final String workTime;

  RestaurantModel({
    this.id,
    this.imageUrl,
    this.name,
    this.minOrderPrice,
    this.deliveryPrice,
    this.deliveryTime,
    this.workTime,
  });
}
