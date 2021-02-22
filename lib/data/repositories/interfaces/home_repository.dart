import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';

abstract class HomeRepository {
  Future<List<PromoModel>> getPromosList();

  Future<List<PopularModel>> getPopularList();

  Future<List<RestaurantModel>> getRestaurantsList();
}
