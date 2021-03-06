import 'package:delivery_service/data/models/dish_model.dart';

abstract class RestaurantRepository {
  Future<List<DishModel>> getDishList(String restaurantId);
}
