// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class PromoModel {
  final String id;
  final String title;
  final String imageUrl;

  const PromoModel({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'PromoModel{id: ' +
        id.toString() +
        ', title: ' +
        title.toString() +
        ', imageUrl: ' +
        imageUrl.toString() +
        '}';
  }

  PromoModel copyWith({
    String id,
    String title,
    String imageUrl,
  }) {
    return PromoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  PromoModel.fromMap(Map<String, dynamic> m)
      : id = m['id'],
        title = m['title'],
        imageUrl = m['imageUrl'];

  Map<String, dynamic> toMap() =>
      {'id': id, 'title': title, 'imageUrl': imageUrl};

  factory PromoModel.fromJson(String json) =>
      PromoModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
