class RestaurantModel {
  final String imageUrl;
  final String name;
  final double minOrderPrice;
  final int minDeliveryTime;
  final int maxDeliveryTime;

  RestaurantModel({
    this.imageUrl,
    this.name,
    this.minOrderPrice,
    this.minDeliveryTime,
    this.maxDeliveryTime,
  });
}
