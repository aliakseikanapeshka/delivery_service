import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/repositories/interfaces/restaurant_repository.dart';

class MockRestaurantRepositoryImpl implements RestaurantRepository {
  @override
  Future<List<DishModel>> getDishList(String restaurantId) async {
    await Future.delayed(Duration(seconds: 5));

    final dishList = <DishModel>[
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429267-5906.jpeg",
        name: "Chefburger De Lux spicy",
        price: "5.10 BYN",
        description:
            "original chicken fillet, tomato, lettuce Iceberg, sauce Caesar, bun, slice of cheese, slice of bacon",
        weight: 182,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033421-3837.jpeg",
        name: "Cheeseburger De Lux",
        price: "4.50 BYN",
        description:
            "bun Sunny, chicken fillet original, pickled cucumbers, onion, tomatoes, Iceberg, cheese, ketchup, mustard sauce",
        weight: 234,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524032604-7004.jpeg",
        name: "Twister Original",
        price: "6.10 BYN",
        description:
            "wheat tortilla, chicken fillet strips, tomatoes, Iceberg, mayonnaise sauce",
        weight: 192,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429355-3087.jpeg",
        name: "Twister De Lux original",
        price: "6.60 BYN",
        description:
            "wheat flatbread, juicy original chicken strips in breading, mustard, ketchup, bacon, onion, cheese Ementaler, pickled cucumbers, lettuce",
        weight: 200,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420387-3271.jpeg",
        name: "Boxmaster Original",
        price: "6.60 BYN",
        description:
            "wheat tortilla, strips, potato pancake, tomato, mayonnaise sauce, Iceberg, cheese",
        weight: 250,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1584020836-4097.jpeg",
        name: "Longer cheese",
        price: "2.40 BYN",
        description:
            "bun, chicken fillet, cheese, mustard sauce, onion, pickled cucumbers, ketchup",
        weight: 105,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033403-0542.jpeg",
        name: "Cheeseburger",
        price: "2.95 BYN",
        description:
            "bun Sunny, 2 chicken fillet strips original, pickled cucumbers, cheese, ketchup, onion, mustard sauce",
        weight: 177,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1548066094-4404.jpeg",
        name: "Twister Junior",
        price: "3.30 BYN",
        description:
            "cheese tortilla, chicken strips, onion, cheese, pickled cucumbers, ketchup, mustard sauce",
        weight: 170,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034287-0491.jpeg",
        name: "9 wings spicy",
        price: "9.90 BYN",
        description: "Nine spicy chicken wings",
        weight: 30,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034609-7531.jpeg",
        name: "9 strips",
        price: "9.50 BYN",
        description: "Nine strips from chicken",
        weight: 25,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524911805-8524.jpeg",
        name: "4 legs",
        price: "7.70 BYN",
        description: "Four chicken legs",
        weight: 57,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1567752356-1837.jpeg",
        name: "French fries standart",
        price: "3.10 BYN",
        weight: 100,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558450170-9471.jpeg",
        name: "Basket M",
        price: "18.90 BYN",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420483-7047.jpeg",
        name: "Bites middle",
        price: "4.70 BYN",
        description: "20 wings",
        weight: 400,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1607351946-9532.jpeg",
        name: "Coca Cola",
        price: "2.50 BYN",
        description: "400ml",
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1573555431-0558.jpeg",
        name: "Coffee Latte",
        price: "3.80 BYN",
        description: "275ml",
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1611843002-0903.jpeg",
        name: "Pie Strawberry cream cheese",
        price: "2.40 BYN",
        weight: 82,
      ),
    ];

    return dishList;
  }
}
