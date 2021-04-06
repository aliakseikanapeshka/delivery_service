import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'restaurant_model.g.dart';

@data
class $RestaurantModel {
  String id;
  String imageUrl;
  String name;
  double minOrderPrice;
  double deliveryPrice;
  String deliveryTime;
  String workTime;
}
