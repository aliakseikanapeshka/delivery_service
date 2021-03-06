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
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033421-3837.jpeg",
        name: "Cheeseburger De Lux",
        price: "4.50 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524032604-7004.jpeg",
        name: "Twister Original",
        price: "6.10 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558429355-3087.jpeg",
        name: "Twister De Lux original",
        price: "6.60 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420387-3271.jpeg",
        name: "Boxmaster Original",
        price: "6.60 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1584020836-4097.jpeg",
        name: "Longer cheese",
        price: "2.40 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524033403-0542.jpeg",
        name: "Cheeseburger",
        price: "2.95 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1548066094-4404.jpeg",
        name: "Twister Junior",
        price: "3.30 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034287-0491.jpeg",
        name: "9 wings spicy",
        price: "9.90 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524034609-7531.jpeg",
        name: "9 strips",
        price: "9.50 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1524911805-8524.jpeg",
        name: "4 legs",
        price: "7.70 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1567752356-1837.jpeg",
        name: "French fries standart",
        price: "3.10 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558450170-9471.jpeg",
        name: "Basket M",
        price: "18.90 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1558420483-7047.jpeg",
        name: "Bites middle",
        price: "4.70 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1607351946-9532.jpeg",
        name: " Coca Cola",
        price: "2.50 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1573555431-0558.jpeg",
        name: "Coffee Latte",
        price: "3.80 BYN",
        description: "description",
        weight: 120,
      ),
      DishModel(
        imageUrl:
            "https://www.menu.by/resources/default/img/restaurant_products/small/1611843002-0903.jpeg",
        name: "Pie Strawberry cream cheese",
        price: "2.40 BYN",
        description: "description",
        weight: 120,
      ),
    ];

    return dishList;
  }
}
