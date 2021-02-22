import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/price_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';

class MockHomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PromoModel>> getPromosList() async {
    await Future.delayed(Duration(seconds: 5));

    final promoList = <PromoModel>[
      PromoModel(
        title: "5 for price of 3",
        imageUrl:
            "https://ak.picdn.net/shutterstock/videos/1008806375/thumb/1.jpg",
      ),
      PromoModel(
        title: "Discount 30%",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/f/f2/%D0%A8%D0%B0%D1%83%D1%80%D0%BC%D0%B0.jpg",
      ),
      PromoModel(
        title: "Free delivery",
        imageUrl:
            "https://cdn22.img.ria.ru/images/98976/61/989766135_0:100:2000:1233_600x0_80_0_0_6d6bae20fceb464509076685137302b6.jpg",
      ),
      PromoModel(
        title: "Discount 20% for the first order",
        imageUrl:
            "https://hungryboyfriend.ru/wp-content/uploads/2016/06/burgeri_gotovi.jpg",
      ),
    ];

    // final promoList = List<PromoModel>();
    //
    // for (var i = 1; i < 6; i++) {
    //   promoList.add(PromoModel(
    //     title: "Title$i",
    //     imageUrl:
    //         "https://www.menu.by/resources/default/img/restaurant_products/small/1606478021-7269.jpeg",
    //   ));
    // }

    return promoList;
  }

  @override
  Future<List<PopularModel>> getPopularList() async {
    await Future.delayed(Duration(seconds: 5));

    final favoriteList = <PopularModel>[
      PopularModel(
        restaurantName: "McDonald’s",
        imageUrl:
            "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
      ),
      PopularModel(
        restaurantName: "KFC",
        imageUrl:
            "https://new-retail.ru/upload/iblock/708/7089284ef3fd9ba91200526e510a0189.jpg",
      ),
      PopularModel(
        restaurantName: "PizzaHut",
        imageUrl:
            "http://retail-loyalty.org/upload/iblock/7aa/65f80645f09a7ee13e53ee1e0ad297c4.jpg",
      ),
    ];

    // final favoriteList = List<FavoriteModel>();
    //
    // for (var i = 1; i < 6; i++) {
    //   favoriteList.add(FavoriteModel(
    //     restaurantName: "Restaurant$i",
    //     imageUrl:
    //         "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
    //   ));
    // }

    return favoriteList;
  }

  @override
  Future<List<RestaurantModel>> getRestaurantsList() async {
    await Future.delayed(Duration(seconds: 5));

    final restaurantList = <RestaurantModel>[
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
        name: "Subway",
        minDeliveryTime: 60,
        maxDeliveryTime: 80,
        minOrderPrice: Price(
          value: 9.99,
          currency: "BYN",
        ),
        imageUrl:
            "https://visitkearney.org/wp-content/uploads/2020/06/subway_kearney_ne_2-1.jpg",
      ),
      RestaurantModel(
        name: "Papa Johns",
        minDeliveryTime: 40,
        maxDeliveryTime: 90,
        minOrderPrice: Price(
          value: 20,
          currency: "BYN",
        ),
        imageUrl:
            "http://retail-loyalty.org/upload/iblock/921/365d2a04ea5a78b404a9445072ae8742.jpg",
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
