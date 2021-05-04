// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class DishModel {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final String description;
  final String sizeInfo;

  const DishModel({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.sizeInfo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DishModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl &&
          name == other.name &&
          price == other.price &&
          description == other.description &&
          sizeInfo == other.sizeInfo;

  @override
  int get hashCode =>
      id.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      price.hashCode ^
      description.hashCode ^
      sizeInfo.hashCode;

  @override
  String toString() {
    return 'DishModel{id: ' +
        id.toString() +
        ', imageUrl: ' +
        imageUrl.toString() +
        ', name: ' +
        name.toString() +
        ', price: ' +
        price.toString() +
        ', description: ' +
        description.toString() +
        ', sizeInfo: ' +
        sizeInfo.toString() +
        '}';
  }

  DishModel copyWith({
    String id,
    String imageUrl,
    String name,
    double price,
    String description,
    String sizeInfo,
  }) {
    return DishModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      sizeInfo: sizeInfo ?? this.sizeInfo,
    );
  }

  DishModel.fromMap(Map<String, dynamic> m)
      : id = m['id'],
        imageUrl = m['imageUrl'],
        name = m['name'],
        price = m['price'],
        description = m['description'],
        sizeInfo = m['sizeInfo'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'imageUrl': imageUrl,
        'name': name,
        'price': price,
        'description': description,
        'sizeInfo': sizeInfo
      };

  factory DishModel.fromJson(String json) =>
      DishModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
