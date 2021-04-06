import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'dish_model.g.dart';

@data
class $DishModel {
  String id;
  String imageUrl;
  String name;
  double price;
  String description;
  String sizeInfo;
}
