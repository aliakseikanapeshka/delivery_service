import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/price.dart';
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
        price: Price(
          value: 5.1,
          currency: "BYN",
        ),
        description:
            "original chicken fillet, tomato, lettuce Iceberg, sauce Caesar, bun, slice of cheese, slice of bacon",
        weight: 182,
      ),
      DishModel(
        id: "qr3q3rewvrvq",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033421-3837.jpeg",
        name: "Cheeseburger De Lux",
        price: Price(
          value: 4.5,
          currency: "BYN",
        ),
        description:
            "bun Sunny, chicken fillet original, pickled cucumbers, onion, tomatoes, Iceberg, cheese, ketchup, mustard sauce",
        weight: 234,
      ),
      DishModel(
        id: "6rtwwwqw33qeq",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524032604-7004.jpeg",
        name: "Twister Original",
        price: Price(
          value: 6.1,
          currency: "BYN",
        ),
        description:
            "wheat tortilla, chicken fillet strips, tomatoes, Iceberg, mayonnaise sauce",
        weight: 192,
      ),
      DishModel(
        id: "32342133rqwerqe",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429355-3087.jpeg",
        name: "Twister De Lux original",
        price: Price(
          value: 6.6,
          currency: "BYN",
        ),
        description:
            "wheat flatbread, juicy original chicken strips in breading, mustard, ketchup, bacon, onion, cheese Ementaler, pickled cucumbers, lettuce",
        weight: 200,
      ),
      DishModel(
        id: "qw3qwrqwq3wqqaaa",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420387-3271.jpeg",
        name: "Boxmaster Original",
        price: Price(
          value: 6.6,
          currency: "BYN",
        ),
        description:
            "wheat tortilla, strips, potato pancake, tomato, mayonnaise sauce, Iceberg, cheese",
        weight: 250,
      ),
      DishModel(
        id: "fwf43wt43q4tjhjs",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1584020836-4097.jpeg",
        name: "Longer cheese",
        price: Price(
          value: 2.4,
          currency: "BYN",
        ),
        description:
            "bun, chicken fillet, cheese, mustard sauce, onion, pickled cucumbers, ketchup",
        weight: 105,
      ),
      DishModel(
        id: "afw43qwwqeqwe",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033403-0542.jpeg",
        name: "Cheeseburger",
        price: Price(
          value: 2.95,
          currency: "BYN",
        ),
        description:
            "bun Sunny, 2 chicken fillet strips original, pickled cucumbers, cheese, ketchup, onion, mustard sauce",
        weight: 177,
      ),
      DishModel(
        id: "5wreq5q5q",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1548066094-4404.jpeg",
        name: "Twister Junior",
        price: Price(
          value: 3.3,
          currency: "BYN",
        ),
        description:
            "cheese tortilla, chicken strips, onion, cheese, pickled cucumbers, ketchup, mustard sauce",
        weight: 170,
      ),
      DishModel(
        id: "22q2q111taeta",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034287-0491.jpeg",
        name: "9 wings spicy",
        price: Price(
          value: 9.90,
          currency: "BYN",
        ),
        description: "Nine spicy chicken wings",
        weight: 30,
      ),
      DishModel(
        id: "vsfga4ae424q2",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034609-7531.jpeg",
        name: "9 strips",
        price: Price(
          value: 9.50,
          currency: "BYN",
        ),
        description: "Nine strips from chicken",
        weight: 25,
      ),
      DishModel(
        id: "hwrrqef3223",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524911805-8524.jpeg",
        name: "4 legs",
        price: Price(
          value: 7.70,
          currency: "BYN",
        ),
        description: "Four chicken legs",
        weight: 57,
      ),
      DishModel(
        id: "ffff32222211d",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1567752356-1837.jpeg",
        name: "French fries standart",
        price: Price(
          value: 3.10,
          currency: "BYN",
        ),
        weight: 100,
      ),
      DishModel(
        id: "kgjeti47827",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558450170-9471.jpeg",
        name: "Basket M",
        price: Price(
          value: 18.90,
          currency: "BYN",
        ),
        weight: 120,
      ),
      DishModel(
        id: "w362872rywufi2f",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420483-7047.jpeg",
        name: "Bites middle",
        price: Price(
          value: 4.7,
          currency: "BYN",
        ),
        description: "20 wings",
        weight: 400,
      ),
      DishModel(
        id: "76248r27ryyugf",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1607351946-9532.jpeg",
        name: "Coca Cola",
        price: Price(
          value: 2.5,
          currency: "BYN",
        ),
        description: "400ml",
      ),
      DishModel(
        id: "nvnabdfbwf328233",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1573555431-0558.jpeg",
        name: "Coffee Latte",
        price: Price(
          value: 3.8,
          currency: "BYN",
        ),
        description: "275ml",
      ),
      DishModel(
        id: "7928uf9j",
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1611843002-0903.jpeg",
        name: "Pie Strawberry cream cheese",
        price: Price(
          value: 2.4,
          currency: "BYN",
        ),
        weight: 82,
      ),
    ];

    return dishList;
  }
}
