// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// AutoDataGenerator
// **************************************************************************

@immutable
class OrderModel {
  final String address;
  final String comment;
  final String email;
  final String name;
  final String paymentType;
  final int persons;
  final String phone;
  final String promoCode;
  final String restaurantId;
  final Map<String, int> orderedPositions;

  const OrderModel({
    @required this.address,
    @required this.comment,
    @required this.email,
    @required this.name,
    @required this.paymentType,
    @required this.persons,
    @required this.phone,
    @required this.promoCode,
    @required this.restaurantId,
    @required this.orderedPositions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          comment == other.comment &&
          email == other.email &&
          name == other.name &&
          paymentType == other.paymentType &&
          persons == other.persons &&
          phone == other.phone &&
          promoCode == other.promoCode &&
          restaurantId == other.restaurantId &&
          orderedPositions == other.orderedPositions;

  @override
  int get hashCode =>
      address.hashCode ^
      comment.hashCode ^
      email.hashCode ^
      name.hashCode ^
      paymentType.hashCode ^
      persons.hashCode ^
      phone.hashCode ^
      promoCode.hashCode ^
      restaurantId.hashCode ^
      orderedPositions.hashCode;

  @override
  String toString() {
    return 'OrderModel{address: ' +
        address.toString() +
        ', comment: ' +
        comment.toString() +
        ', email: ' +
        email.toString() +
        ', name: ' +
        name.toString() +
        ', paymentType: ' +
        paymentType.toString() +
        ', persons: ' +
        persons.toString() +
        ', phone: ' +
        phone.toString() +
        ', promoCode: ' +
        promoCode.toString() +
        ', restaurantId: ' +
        restaurantId.toString() +
        ', orderedPositions: ' +
        orderedPositions.toString() +
        '}';
  }

  OrderModel copyWith({
    String address,
    String comment,
    String email,
    String name,
    String paymentType,
    int persons,
    String phone,
    String promoCode,
    String restaurantId,
    Map<String, int> orderedPositions,
  }) {
    return OrderModel(
      address: address ?? this.address,
      comment: comment ?? this.comment,
      email: email ?? this.email,
      name: name ?? this.name,
      paymentType: paymentType ?? this.paymentType,
      persons: persons ?? this.persons,
      phone: phone ?? this.phone,
      promoCode: promoCode ?? this.promoCode,
      restaurantId: restaurantId ?? this.restaurantId,
      orderedPositions: orderedPositions ?? this.orderedPositions,
    );
  }

  OrderModel.fromMap(Map<String, dynamic> m)
      : address = m['address'],
        comment = m['comment'],
        email = m['email'],
        name = m['name'],
        paymentType = m['paymentType'],
        persons = m['persons'],
        phone = m['phone'],
        promoCode = m['promoCode'],
        restaurantId = m['restaurantId'],
        orderedPositions = m['orderedPositions'];

  Map<String, dynamic> toMap() => {
        'address': address,
        'comment': comment,
        'email': email,
        'name': name,
        'paymentType': paymentType,
        'persons': persons,
        'phone': phone,
        'promoCode': promoCode,
        'restaurantId': restaurantId,
        'orderedPositions': orderedPositions
      };

  factory OrderModel.fromJson(String json) =>
      OrderModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
