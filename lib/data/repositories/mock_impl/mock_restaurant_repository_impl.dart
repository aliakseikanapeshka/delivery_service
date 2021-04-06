import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/repositories/interfaces/restaurant_repository.dart';

class MockRestaurantRepositoryImpl implements RestaurantRepository {
  @override
  Future<List<DishModel>> getDishList(String restaurantId) async {
    await Future.delayed(Duration(seconds: 1));

    final dishList = <DishModel>[
      DishModel(
        id: "qwerqewr32",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429267-5906.jpeg",
        name: "Chefburger De Lux spicy",
        price: 5.1,
        description:
            "original chicken fillet, tomato, lettuce Iceberg, sauce Caesar, bun, slice of cheese, slice of bacon",
        sizeInfo: "182g",
      ),
      DishModel(
        id: "qr3q3rewvrvq",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033421-3837.jpeg",
        name: "Cheeseburger De Lux",
        price: 4.5,
        description:
            "bun Sunny, chicken fillet original, pickled cucumbers, onion, tomatoes, Iceberg, cheese, ketchup, mustard sauce",
        sizeInfo: "234g",
      ),
      DishModel(
        id: "6rtwwwqw33qeq",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524032604-7004.jpeg",
        name: "Twister Original",
        price: 6.1,
        description:
            "wheat tortilla, chicken fillet strips, tomatoes, Iceberg, mayonnaise sauce",
        sizeInfo: "192g",
      ),
      DishModel(
        id: "32342133rqwerqe",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429355-3087.jpeg",
        name: "Twister De Lux original",
        price: 6.6,
        description:
            "wheat flatbread, juicy original chicken strips in breading, mustard, ketchup, bacon, onion, cheese Ementaler, pickled cucumbers, lettuce",
        sizeInfo: "200g",
      ),
      DishModel(
        id: "qw3qwrqwq3wqqaaa",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420387-3271.jpeg",
        name: "Boxmaster Original",
        price: 6.6,
        description:
            "wheat tortilla, strips, potato pancake, tomato, mayonnaise sauce, Iceberg, cheese",
        sizeInfo: "250g",
      ),
      DishModel(
        id: "fwf43wt43q4tjhjs",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1584020836-4097.jpeg",
        name: "Longer cheese",
        price: 2.4,
        description:
            "bun, chicken fillet, cheese, mustard sauce, onion, pickled cucumbers, ketchup",
        sizeInfo: "105g",
      ),
      DishModel(
        id: "afw43qwwqeqwe",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033403-0542.jpeg",
        name: "Cheeseburger",
        price: 2.95,
        description:
            "bun Sunny, 2 chicken fillet strips original, pickled cucumbers, cheese, ketchup, onion, mustard sauce",
        sizeInfo: "177g",
      ),
      DishModel(
        id: "5wreq5q5q",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1548066094-4404.jpeg",
        name: "Twister Junior",
        price: 3.3,
        description:
            "cheese tortilla, chicken strips, onion, cheese, pickled cucumbers, ketchup, mustard sauce",
        sizeInfo: "170g",
      ),
      DishModel(
        id: "22q2q111taeta",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034287-0491.jpeg",
        name: "9 wings spicy",
        price: 9.90,
        description: "Nine spicy chicken wings",
        sizeInfo: "30g",
      ),
      DishModel(
        id: "vsfga4ae424q2",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034609-7531.jpeg",
        name: "9 strips",
        price: 9.50,
        description: "Nine strips from chicken",
        sizeInfo: "25g",
      ),
      DishModel(
        id: "hwrrqef3223",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524911805-8524.jpeg",
        name: "4 legs",
        price: 7.70,
        description: "Four chicken legs",
        sizeInfo: "57g",
      ),
      DishModel(
        id: "ffff32222211d",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1567752356-1837.jpeg",
        name: "French fries standart",
        price: 3.10,
        sizeInfo: "100g",
      ),
      DishModel(
        id: "kgjeti47827",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558450170-9471.jpeg",
        name: "Basket M",
        price: 18.90,
        sizeInfo: "120g",
      ),
      DishModel(
        id: "w362872rywufi2f",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420483-7047.jpeg",
        name: "Bites middle",
        price: 4.7,
        description: "20 wings",
        sizeInfo: "400g",
      ),
      DishModel(
        id: "76248r27ryyugf",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1607351946-9532.jpeg",
        name: "Coca Cola",
        price: 2.5,
        sizeInfo: "400ml",
      ),
      DishModel(
        id: "nvnabdfbwf328233",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1573555431-0558.jpeg",
        name: "Coffee Latte",
        price: 3.8,
        sizeInfo: "275ml",
      ),
      DishModel(
        id: "7928uf9j",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1611843002-0903.jpeg",
        name: "Pie Strawberry cream cheese",
        price: 2.4,
        sizeInfo: "82g",
      ),
    ];

    return dishList;
  }
}
