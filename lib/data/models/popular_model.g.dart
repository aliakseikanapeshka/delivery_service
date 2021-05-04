// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class PopularModel {
  final String id;
  final String imageUrl;
  final String restaurantName;

  const PopularModel({
    @required this.id,
    @required this.imageUrl,
    @required this.restaurantName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl &&
          restaurantName == other.restaurantName;

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ restaurantName.hashCode;

  @override
  String toString() {
    return 'PopularModel{id: ' +
        id.toString() +
        ', imageUrl: ' +
        imageUrl.toString() +
        ', restaurantName: ' +
        restaurantName.toString() +
        '}';
  }

  PopularModel copyWith({
    String id,
    String imageUrl,
    String restaurantName,
  }) {
    return PopularModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      restaurantName: restaurantName ?? this.restaurantName,
    );
  }

  PopularModel.fromMap(Map<String, dynamic> m)
      : id = m['id'],
        imageUrl = m['imageUrl'],
        restaurantName = m['restaurantName'];

  Map<String, dynamic> toMap() =>
      {'id': id, 'imageUrl': imageUrl, 'restaurantName': restaurantName};

  factory PopularModel.fromJson(String json) =>
      PopularModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
