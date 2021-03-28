import 'package:delivery_service/data/models/price_model.dart';

class DishModel {
  final String id;
  final String imageUrl;
  final String name;
  final Price price;
  final String description;
  final int weight;

  DishModel({
    this.id,
    this.imageUrl,
    this.name,
    this.price,
    this.description,
    this.weight,
  });
}
