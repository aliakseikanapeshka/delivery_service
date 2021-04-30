import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/repositories/interfaces/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  @override
  Future<List<DishModel>> getDishList(String restaurantId) async {
    final dishList = <DishModel>[];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("restaurants/$restaurantId/dishes")
          .get();

      querySnapshot.docs.forEach((element) {
        DishModel restaurantModel = DishModel(
          id: element.id,
          name: element.get("name"),
          description: element.get("description"),
          imageUrl: element.get("imageUrl"),
          price: double.parse(element.get("price").toString()),
          sizeInfo: element.get("sizeInfo"),
        );

        dishList.add(restaurantModel);
        //QueryDocumentSnapshot
      });
    } catch (e) {
      print(e);
    }

    return dishList;
  }
}
