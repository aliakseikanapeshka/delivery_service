import 'package:delivery_service/data/models/promo_model.dart';

abstract class PromoRepository {
  Future<List<PromoModel>> getPromosList();
}
