import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'order_model.g.dart';

@data
class $OrderModel {
  String address;
  String comment;
  String email;
  String name;
  String paymentType;
  int persons;
  String phone;
  String promoCode;
  String restaurantId;
  Map<String, int> orderedPositions;
}