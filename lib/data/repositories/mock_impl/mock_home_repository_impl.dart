import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';

class MockHomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PromoModel>> getPromosList() async {
    await Future.delayed(Duration(seconds: 1));

    final promoList = <PromoModel>[
      PromoModel(
        id: "1",
        title: "5 for price of 3",
        imageUrl:
            "https://ak.picdn.net/shutterstock/videos/1008806375/thumb/1.jpg",
      ),
      PromoModel(
        id: "2",
        title: "Discount 30%",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/f/f2/%D0%A8%D0%B0%D1%83%D1%80%D0%BC%D0%B0.jpg",
      ),
      PromoModel(
        id: "3",
        title: "Free delivery",
        imageUrl:
            "https://cdn22.img.ria.ru/images/98976/61/989766135_0:100:2000:1233_600x0_80_0_0_6d6bae20fceb464509076685137302b6.jpg",
      ),
      PromoModel(
        id: "4",
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
  Future<List<RestaurantModel>> getPopularList() async {
    await Future.delayed(Duration(seconds: 1));

    final popularList = <RestaurantModel>[
      RestaurantModel(
        id: "6",
        name: "KFC",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 10,
        deliveryPrice: 3,
        imageUrl:
            "https://new-retail.ru/upload/iblock/708/7089284ef3fd9ba91200526e510a0189.jpg",
      ),
      RestaurantModel(
        id: "7",
        name: "McDonald’s",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 14.99,
        deliveryPrice: 3,
        imageUrl:
            "https://geekville.ru/wp-content/uploads/2020/08/McDonalds.jpg",
      ),
      RestaurantModel(
        id: "123",
        name: "PizzaHut",
        deliveryTime: "50-80 min",
        workTime: "Open 11:00-23:00",
        minOrderPrice: 20,
        deliveryPrice: 3,
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

    return popularList;
  }

  @override
  Future<List<RestaurantModel>> getRestaurantsList() async {
    await Future.delayed(Duration(seconds: 1));

    final restaurantList = <RestaurantModel>[
      RestaurantModel(
        id: "1",
        name: "Domino’s Pizza",
        deliveryTime: "20-50 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 25,
        deliveryPrice: 3,
        imageUrl:
            "https://www.holiday.by/files/houses/thumbnails/houses_gallery_large_preview/dc65b0c7bfe6e6a7238284d2bd5e4944.png",
      ),
      RestaurantModel(
        id: "2",
        name: "Subway",
        deliveryTime: "60-80 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 9.99,
        deliveryPrice: 3,
        imageUrl:
            "https://visitkearney.org/wp-content/uploads/2020/06/subway_kearney_ne_2-1.jpg",
      ),
      RestaurantModel(
        id: "3",
        name: "Papa Johns",
        deliveryTime: "40-90 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 20,
        deliveryPrice: 3,
        imageUrl:
            "http://retail-loyalty.org/upload/iblock/921/365d2a04ea5a78b404a9445072ae8742.jpg",
      ),
      RestaurantModel(
        id: "4",
        name: "Sushi house",
        deliveryTime: "60-90 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 18,
        deliveryPrice: 3,
        imageUrl:
            "https://img.championat.com/news/big/w/q/pochemu-sushi-vredny-dlja-figury_1590677088981164064.jpg",
      ),
      RestaurantModel(
        id: "5",
        name: "Doner king",
        deliveryTime: "40-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 1,
        deliveryPrice: 3,
        imageUrl:
            "https://www.gastronom.ru/binfiles/images/20180729/b8db6c6c.jpg",
      ),
      RestaurantModel(
        id: "6",
        name: "KFC",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 10,
        deliveryPrice: 3,
        imageUrl:
            "https://new-retail.ru/upload/iblock/708/7089284ef3fd9ba91200526e510a0189.jpg",
      ),
      RestaurantModel(
        id: "7",
        name: "McDonald’s",
        deliveryTime: "30-60 min",
        workTime: "Open 10:00-23:00",
        minOrderPrice: 14.99,
        deliveryPrice: 3,
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
