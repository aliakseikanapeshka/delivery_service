import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/data/repositories/interfaces/promo_repository.dart';

class MockPromoRepositoryImpl implements PromoRepository {
  @override
  Future<List<PromoModel>> getPromosList() async {
    await Future.delayed(Duration(seconds: 1));

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
      PromoModel(
        title: "Gift when ordering from 20 BYN",
        imageUrl: "https://api.afimall.ru/upload/iblock/033/orig_1.jpg",
      ),
      PromoModel(
        title: "1 + 1 = 3",
        imageUrl:
            "https://static.1000.menu/img/content/22983/lapsha-vok-so-svininoi-i-ovoshchami_1508064640_1_max.jpg",
      ),
      PromoModel(
        title: "Discount 25%",
        imageUrl:
            "https://image.shutterstock.com/image-photo/shish-kebab-mushrooms-cherry-tomato-600w-1347040721.jpg",
      ),
      PromoModel(
        title: "Free delivery",
        imageUrl:
            "https://www.holiday.by/files/houses/thumbnails/houses_gallery_large_preview/e79d90e5d6840417821504d40b1571ca.jpg",
      ),
    ];

    // final promoList = List<PromoModel>();
    //
    // for (var i = 1; i < 10; i++) {
    //   promoList.add(PromoModel(
    //     title: "Title$i",
    //     imageUrl:
    //         "https://www.menu.by/resources/default/img/restaurant_products/small/1606478021-7269.jpeg",
    //   ));
    // }

    return promoList;
  }
}
