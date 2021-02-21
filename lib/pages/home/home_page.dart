import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/favorite_info_card.dart';
import 'package:delivery_service/widgets/horizontal_shimmer_swipe_lane.dart';
import 'package:delivery_service/widgets/horizontal_swipe_lane.dart';
import 'package:delivery_service/widgets/promo_info_card.dart';
import 'package:delivery_service/widgets/restaurant_info_card.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shimmer/shimmer.dart';

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
            title: Text(
              translate(LocalizationKeys.Home_Title),
              style: textTheme.headline4,
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(BaseState state) => SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: _getSliverFromState(state),
        ),
      );

  List<Widget> _getSliverFromState(BaseState state) {
    if (state is InitialState) {
      return _getShimmerSlivers();
    } else {
      return _getContentSlivers();
    }
  }

  List<Widget> _getShimmerSlivers() => [
        _buildShimmerSectionTitle(),
        _buildShimmerHorizontalLane(),
        _buildShimmerSectionTitle(isNeedTopSpacing: true),
        _buildShimmerHorizontalLane(),
        _buildShimmerSectionTitle(isNeedTopSpacing: true),
        _buildShimmerList(),
        _buildBottomSpacingSliver(),
      ];

  List<Widget> _getContentSlivers() => [
        if (bloc.promosList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Promo),
          ),
        if (bloc.promosList.isNotEmpty) _buildPromoLane(),
        if (bloc.favoritesList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Favorites),
            isNeedTopSpacing: true,
          ),
        if (bloc.favoritesList.isNotEmpty) _buildFavoritesLane(),
        if (bloc.restaurantsList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Restaurants),
            isNeedTopSpacing: true,
          ),
        if (bloc.restaurantsList.isNotEmpty) _buildRestaurantsList(),
        _buildBottomSpacingSliver(),
      ];

  Widget _buildPromoLane() => SliverToBoxAdapter(
        child: HorizontalSwipeLane<PromoModel>(
          items: bloc.promosList,
          childWidgetBuilder: (context, model) => PromoInfoCard(
            model: model,
          ),
        ),
      );

  Widget _buildFavoritesLane() => SliverToBoxAdapter(
        child: HorizontalSwipeLane<FavoriteModel>(
          items: bloc.favoritesList,
          childWidgetBuilder: (context, model) => FavoriteInfoCard(
            model: model,
          ),
        ),
      );

  Widget _buildRestaurantsList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.92,
                child: RestaurantInfoCard(
                  model: bloc.restaurantsList[index],
                ),
              ),
              SizedBox(height: Insets.x2),
            ],
          ),
          childCount: bloc.restaurantsList.length,
        ),
      );

  Widget _buildSectionTitle({
    String title,
    bool isNeedTopSpacing = false,
  }) =>
      SliverToBoxAdapter(
        child: Column(
          children: [
            if (isNeedTopSpacing) SizedBox(height: Insets.x5),
            SizedBox(
              height: Insets.x5,
              child: FractionallySizedBox(
                widthFactor: 0.90,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: textTheme.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildShimmerHorizontalLane() => SliverToBoxAdapter(
        child: HorizontalShimmerSwipeLane(),
      );

  Widget _buildShimmerList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Column(
            children: [
              SizedBox(
                height: 256,
                child: FractionallySizedBox(
                  widthFactor: 0.92,
                  child: ShimmerCard(),
                ),
              ),
              SizedBox(height: Insets.x2),
            ],
          ),
          childCount: 3,
        ),
      );

  Widget _buildShimmerSectionTitle({
    bool isNeedTopSpacing = false,
  }) =>
      SliverToBoxAdapter(
        child: Column(
          children: [
            if (isNeedTopSpacing) SizedBox(height: Insets.x5),
            SizedBox(
              height: Insets.x6,
              child: FractionallySizedBox(
                widthFactor: 0.90,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Shimmer.fromColors(
                    baseColor: BrandingColors.shimmerContent,
                    highlightColor: BrandingColors.shimmerContentHighlight,
                    child: Container(
                      height: 14,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Radiuses.small_3x),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildBottomSpacingSliver() => SliverToBoxAdapter(
        child: SizedBox(height: kBottomNavigationBarHeight),
      );
}
