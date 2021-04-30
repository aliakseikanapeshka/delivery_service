import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/repositories/interfaces/promo_repository.dart';

class PromoRepositoryImpl implements PromoRepository {
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
}
