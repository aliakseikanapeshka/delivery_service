import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'price.g.dart';

@data
class $Price {
  double value;
  String currency;
}
