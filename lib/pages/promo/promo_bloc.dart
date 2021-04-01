import 'dart:async';

import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';

class PromoBloc extends BaseBloc {
  List<PromoModel> get promosList => List.from(_promosList);

  List<PromoModel> _promosList = [];

  @override
  Stream<BaseState> initialize() async* {
    await _loadData();
    yield BaseState.success();
  }

  @override
  Stream<BaseState> refresh() async* {
    yield BaseState.initial();
    await _loadData();
    yield BaseState.success();
  }

  _loadData() async {
    await Future.wait<void>([
      promoRepository.getPromosList().then((result) => _promosList = result),
    ]);
  }

  @override
  Future close() async {
    await super.close();
  }
}
