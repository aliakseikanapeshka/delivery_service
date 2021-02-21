import 'package:delivery_service/data/models/price_model.dart';

class RestaurantModel {
  final String imageUrl;
  final String name;
  final Price minOrderPrice;
  final int minDeliveryTime;
  final int maxDeliveryTime;

  RestaurantModel({
    this.imageUrl,
    this.name,
    this.minOrderPrice,
    this.minDeliveryTime,
    this.maxDeliveryTime,
  });
}
