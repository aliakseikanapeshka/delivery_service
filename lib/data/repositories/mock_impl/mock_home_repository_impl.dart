import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';

class MockHomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PromoModel>> getPromoList() async {
    final promoList = List<PromoModel>();

    for (var i = 1; i < 6; i++) {
      promoList.add(PromoModel(
        title: "Title$i",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1606478021-7269.jpeg",
      ));
    }

    return promoList;
  }

  @override
  Future<List<FavoriteModel>> getFavoriteList() async {
    final favoriteList = List<FavoriteModel>();

    for (var i = 1; i < 6; i++) {
      favoriteList.add(FavoriteModel(
        restaurantName: "Restaurant$i",
        imageUrl:
            "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
      ));
    }

    return favoriteList;
  }

  @override
  Future<List<RestaurantModel>> getRestaurantList() async {
    final restaurantList = List<RestaurantModel>();

    for (var i = 1; i < 6; i++) {
      restaurantList.add(RestaurantModel(
        name: "Restaurant$i",
        minDeliveryTime: 30,
        maxDeliveryTime: 50,
        minOrderPrice: 15,
        imageUrl: "https://s-english.ru/images/topik/fast-food.jpg",
      ));
    }

    return restaurantList;
  }
}
