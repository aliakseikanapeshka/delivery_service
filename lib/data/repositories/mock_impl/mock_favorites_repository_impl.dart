import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/favorites_repository.dart';

class MockFavoritesRepositoryImpl implements FavoritesRepository {
  @override
  Future<List<RestaurantModel>> getFavoritesList() async {
    await Future.delayed(Duration(seconds: 5));

    final restaurantList = <RestaurantModel>[
      RestaurantModel(
        id: "7",
        name: "McDonald’s",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: "Order from 14.99 BYN",
        deliveryPrice: "Delivery price 3 BYN",
        imageUrl:
            "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
      ),
      RestaurantModel(
        id: "6",
        name: "KFC",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: "Order from 10 BYN",
        deliveryPrice: "Delivery price 3 BYN",
        imageUrl:
            "https://new-retail.ru/upload/iblock/708/7089284ef3fd9ba91200526e510a0189.jpg",
      ),
      RestaurantModel(
        id: "123",
        name: "PizzaHut",
        deliveryTime: "50-80 min",
        workTime: "Open 11:00-23:00",
        minOrderPrice: "Order from 20 BYN",
        deliveryPrice: "Delivery price 3 BYN",
        imageUrl:
            "http://retail-loyalty.org/upload/iblock/7aa/65f80645f09a7ee13e53ee1e0ad297c4.jpg",
      ),
      RestaurantModel(
        id: "1",
        name: "Domino’s Pizza",
        deliveryTime: "20-50 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: "Order from 25 BYN",
        deliveryPrice: "Delivery price 3 BYN",
        imageUrl:
            "https://www.holiday.by/files/houses/thumbnails/houses_gallery_large_preview/dc65b0c7bfe6e6a7238284d2bd5e4944.png",
      ),
      RestaurantModel(
        id: "4",
        name: "Sushi house",
        deliveryTime: "60-90 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: "Order from 18 BYN",
        deliveryPrice: "Delivery price 3 BYN",
        imageUrl:
            "https://img.championat.com/news/big/w/q/pochemu-sushi-vredny-dlja-figury_1590677088981164064.jpg",
      ),
      RestaurantModel(
        id: "5",
        name: "Doner king",
        deliveryTime: "40-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: "Order from 1 BYN",
        deliveryPrice: "Delivery price 3 BYN",
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
