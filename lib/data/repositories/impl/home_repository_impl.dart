import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/data/repositories/interfaces/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PromoModel>> getPromosList() async {
    final promoList = <PromoModel>[];

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("promos").get();

      querySnapshot.docs.forEach((element) {
        PromoModel restaurantModel = PromoModel(
          id: element.id,
          title: element.get("title"),
          imageUrl: element.get("imageUrl"),
        );

        promoList.add(restaurantModel);
        //QueryDocumentSnapshot
      });
    } catch (e) {
      print(e);
    }

    return promoList;
  }

  @override
  Future<List<RestaurantModel>> getPopularList() async {
    final popularList = <RestaurantModel>[];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("restaurants")
          .orderBy("rating", descending: true)
          .limit(4)
          .get();

      querySnapshot.docs.forEach((element) {
        RestaurantModel restaurantModel = RestaurantModel(
          id: element.id,
          imageUrl: element.get("imageUrl"),
          name: element.get("name"),
          minOrderPrice: double.parse(element.get("minOrderPrice").toString()),
          deliveryPrice: double.parse(element.get("deliveryPrice").toString()),
          deliveryTime: element.get("deliveryTime"),
          workTime: element.get("workTime"),
        );

        popularList.add(restaurantModel);
        //QueryDocumentSnapshot
      });
    } catch (e) {
      print(e);
    }

    return popularList;
  }

  @override
  Future<List<RestaurantModel>> getRestaurantsList() async {
    final restaurantList = <RestaurantModel>[];

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("restaurants").get();

      querySnapshot.docs.forEach((element) {
        RestaurantModel restaurantModel = RestaurantModel(
          id: element.id,
          imageUrl: element.get("imageUrl"),
          name: element.get("name"),
          minOrderPrice: double.parse(element.get("minOrderPrice").toString()),
          deliveryPrice: double.parse(element.get("deliveryPrice").toString()),
          deliveryTime: element.get("deliveryTime"),
          workTime: element.get("workTime"),
        );

        restaurantList.add(restaurantModel);
        //QueryDocumentSnapshot
      });
    } catch (e) {
      print(e);
    }

    return restaurantList;
  }
}
