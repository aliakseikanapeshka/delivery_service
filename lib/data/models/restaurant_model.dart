import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'restaurant_model.g.dart';

@data
class $RestaurantModel {
  String id;
  String imageUrl;
  String name;
  String deliveryTime;
  String workTime;
  double minOrderPrice;
  double deliveryPrice;
}
