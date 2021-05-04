import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

import 'dish_model.dart';

part 'cart_model.g.dart';

@data
class $CartModel {
  $DishModel dishModel;
  int count;
}
