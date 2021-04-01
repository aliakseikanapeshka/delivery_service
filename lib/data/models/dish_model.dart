import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:delivery_service/data/models/price.dart';
import 'package:meta/meta.dart';

part 'dish_model.g.dart';

@data
class $DishModel {
  String id;
  String imageUrl;
  String name;
  Price price;
  String description;
  int weight;
}
