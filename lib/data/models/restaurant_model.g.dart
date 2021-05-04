// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class RestaurantModel {
  final String id;
  final String imageUrl;
  final String name;
  final String deliveryTime;
  final String workTime;
  final double minOrderPrice;
  final double deliveryPrice;

  const RestaurantModel({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.deliveryTime,
    @required this.workTime,
    @required this.minOrderPrice,
    @required this.deliveryPrice,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl &&
          name == other.name &&
          deliveryTime == other.deliveryTime &&
          workTime == other.workTime &&
          minOrderPrice == other.minOrderPrice &&
          deliveryPrice == other.deliveryPrice;

  @override
  int get hashCode =>
      id.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      deliveryTime.hashCode ^
      workTime.hashCode ^
      minOrderPrice.hashCode ^
      deliveryPrice.hashCode;

  @override
  String toString() {
    return 'RestaurantModel{id: ' +
        id.toString() +
        ', imageUrl: ' +
        imageUrl.toString() +
        ', name: ' +
        name.toString() +
        ', deliveryTime: ' +
        deliveryTime.toString() +
        ', workTime: ' +
        workTime.toString() +
        ', minOrderPrice: ' +
        minOrderPrice.toString() +
        ', deliveryPrice: ' +
        deliveryPrice.toString() +
        '}';
  }

  RestaurantModel copyWith({
    String id,
    String imageUrl,
    String name,
    String deliveryTime,
    String workTime,
    double minOrderPrice,
    double deliveryPrice,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      workTime: workTime ?? this.workTime,
      minOrderPrice: minOrderPrice ?? this.minOrderPrice,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
    );
  }

  RestaurantModel.fromMap(Map<String, dynamic> m)
      : id = m['id'],
        imageUrl = m['imageUrl'],
        name = m['name'],
        deliveryTime = m['deliveryTime'],
        workTime = m['workTime'],
        minOrderPrice = m['minOrderPrice'],
        deliveryPrice = m['deliveryPrice'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'imageUrl': imageUrl,
        'name': name,
        'deliveryTime': deliveryTime,
        'workTime': workTime,
        'minOrderPrice': minOrderPrice,
        'deliveryPrice': deliveryPrice
      };

  factory RestaurantModel.fromJson(String json) =>
      RestaurantModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
