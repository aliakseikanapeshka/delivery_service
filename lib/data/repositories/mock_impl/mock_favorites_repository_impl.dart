import 'package:delivery_service/data/models/price_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/favorites_repository.dart';

class MockFavoritesRepositoryImpl implements FavoritesRepository {
  @override
  Future<List<RestaurantModel>> getFavoritesList() async {
    await Future.delayed(Duration(seconds: 5));

    final restaurantList = <RestaurantModel>[
      RestaurantModel(
        name: "McDonald’s",
        minDeliveryTime: 30,
        maxDeliveryTime: 60,
        minOrderPrice: Price(
          value: 14.99,
          currency: "BYN",
        ),
        imageUrl:
            "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
      ),
      RestaurantModel(
        name: "KFC",
        minDeliveryTime: 30,
        maxDeliveryTime: 60,
        minOrderPrice: Price(
          value: 10,
          currency: "BYN",
        ),
        imageUrl:
            "https://new-retail.ru/upload/iblock/708/7089284ef3fd9ba91200526e510a0189.jpg",
      ),
      RestaurantModel(
        name: "PizzaHut",
        minDeliveryTime: 50,
        maxDeliveryTime: 80,
        minOrderPrice: Price(
          value: 20,
          currency: "BYN",
        ),
        imageUrl:
            "http://retail-loyalty.org/upload/iblock/7aa/65f80645f09a7ee13e53ee1e0ad297c4.jpg",
      ),
      RestaurantModel(
        name: "Domino’s Pizza",
        minDeliveryTime: 20,
        maxDeliveryTime: 50,
        minOrderPrice: Price(
          value: 25,
          currency: "BYN",
        ),
        imageUrl:
            "https://www.holiday.by/files/houses/thumbnails/houses_gallery_large_preview/dc65b0c7bfe6e6a7238284d2bd5e4944.png",
      ),
      RestaurantModel(
        name: "Sushi house",
        minDeliveryTime: 60,
        maxDeliveryTime: 90,
        minOrderPrice: Price(
          value: 18,
          currency: "BYN",
        ),
        imageUrl:
            "https://img.championat.com/news/big/w/q/pochemu-sushi-vredny-dlja-figury_1590677088981164064.jpg",
      ),
      RestaurantModel(
        name: "Doner king",
        minDeliveryTime: 40,
        maxDeliveryTime: 60,
        minOrderPrice: Price(
          value: 1,
          currency: "BYN",
        ),
        imageUrl:
            "https://www.gastronom.ru/binfiles/images/20180729/b8db6c6c.jpg",
      ),
    ];

    // final restaurantList = List<RestaurantModel>();
    //
    // for (var i = 1; i < 6; i++) {
    //   restaurantList.add(RestaurantModel(
    //     name: "Restaurant$i",
    //     minDeliveryTime: 30,
    //     maxDeliveryTime: 50,
    //     minOrderPrice: 15,
    //     imageUrl: "https://s-english.ru/images/topik/fast-food.jpg",
    //   ));
    // }

    return restaurantList;
  }
}
