import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/horizontal_swipe_lane.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomeBloc, HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, BaseState>(
      cubit: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(translate(LocalizationKeys.Home_Title)),
          ),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          if (bloc.promosList.isNotEmpty) _buildPromoLane(context),
          if (bloc.favoritesList.isNotEmpty) _buildFavoritesLane(context),
          if (bloc.restaurantsList.isNotEmpty) _buildRestaurantsList(context),
        ],
      ),
    );
  }

  Widget _buildPromoLane(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            "Promos",
            style: TextStyle(fontSize: 26),
          ),
          HorizontalSwipeLane<PromoModel>(
            items: bloc.promosList,
            childWidgetBuilder: (context, model) {
              return Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(imageUrl: model.imageUrl),
                    Positioned(
                      top: Insets.x2,
                      left: Insets.x2,
                      child: Text(model.title),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesLane(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            "Favorites",
            style: TextStyle(fontSize: 26),
          ),
          HorizontalSwipeLane<FavoriteModel>(
            items: bloc.favoritesList,
            childWidgetBuilder: (context, model) {
              return Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(imageUrl: model.imageUrl),
                    Positioned(
                      top: Insets.x2,
                      left: Insets.x2,
                      child: Text(model.restaurantName),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantsList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          final model = bloc.restaurantsList[index];
          return SizedBox(
            height: 200,
            child: FractionallySizedBox(
              widthFactor: 0.92,
              child: Card(
                shadowColor: BrandingColors.background,
                elevation: 0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radiuses.big_1x),
                ),
                child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(imageUrl: model.imageUrl),
                      Positioned(
                        top: Insets.x2,
                        left: Insets.x2,
                        child: Column(
                          children: [
                            Text(model.name),
                            Text("from ${model.minOrderPrice} rub"),
                            Text(
                                "${model.minDeliveryTime} - ${model.maxDeliveryTime} min"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: bloc.restaurantsList.length,
      ),
    );
  }
}
