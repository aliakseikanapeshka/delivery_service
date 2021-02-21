import 'package:delivery_service/data/models/restaurant_model.dart';

abstract class FavoritesRepository {
  Future<List<RestaurantModel>> getFavoritesList();
}