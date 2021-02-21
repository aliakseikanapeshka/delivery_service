import 'dart:async';

import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class FavoritesBloc extends BaseBloc {
  List<RestaurantModel> get favoritesList => List.from(_favoritesList);

  List<RestaurantModel> _favoritesList = [];

  @override
  Stream<BaseState> initialize() async* {
    await Future.wait<void>([
      favoritesRepository
          .getFavoritesList()
          .then((result) => _favoritesList = result),
    ]);

    yield BaseState.success();
  }

  @override
  Future close() async {
    await super.close();
  }
}
