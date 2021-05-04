// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class CartModel {
  final DishModel dishModel;
  final int count;

  const CartModel({
    @required this.dishModel,
    @required this.count,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel &&
          runtimeType == other.runtimeType &&
          dishModel == other.dishModel &&
          count == other.count;

  @override
  int get hashCode => dishModel.hashCode ^ count.hashCode;

  @override
  String toString() {
    return 'CartModel{dishModel: ' +
        dishModel.toString() +
        ', count: ' +
        count.toString() +
        '}';
  }

  CartModel copyWith({
    DishModel dishModel,
    int count,
  }) {
    return CartModel(
      dishModel: dishModel ?? this.dishModel,
      count: count ?? this.count,
    );
  }

  CartModel.fromMap(Map<String, dynamic> m)
      : dishModel = DishModel.fromMap(m['dishModel']),
        count = m['count'];

  Map<String, dynamic> toMap() =>
      {'dishModel': dishModel.toMap(), 'count': count};

  factory CartModel.fromJson(String json) =>
      CartModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
