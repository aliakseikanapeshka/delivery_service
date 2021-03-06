import 'package:delivery_service/data/models/promo_model.dart';
import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/horizontal_carousel.dart';
import 'package:delivery_service/widgets/horizontal_shimmer_carousel.dart';
import 'package:delivery_service/widgets/popular_info_card.dart';
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
        _buildShimmerCarousel(),
        _buildShimmerSectionTitle(isNeedTopSpacing: true),
        _buildShimmerLane(),
        _buildShimmerSectionTitle(isNeedTopSpacing: true),
        _buildShimmerList(),
        _buildBottomSpacingSliver(),
      ];

  List<Widget> _getContentSlivers() => [
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 170,
          onRefresh: () async => bloc.add(BaseEvent.refresh()),
        ),
        if (bloc.promosList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Promo),
          ),
        if (bloc.promosList.isNotEmpty) _buildPromoCarousel(),
        if (bloc.popularList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Popular),
            isNeedTopSpacing: true,
          ),
        if (bloc.popularList.isNotEmpty) _buildPopularLane(),
        if (bloc.restaurantsList.isNotEmpty)
          _buildSectionTitle(
            title: translate(LocalizationKeys.Home_Section_Restaurants),
            isNeedTopSpacing: true,
          ),
        if (bloc.restaurantsList.isNotEmpty) _buildRestaurantsList(),
        _buildBottomSpacingSliver(),
      ];

  Widget _buildPromoCarousel() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Insets.x2),
          child: HorizontalCarousel<PromoModel>(
            items: bloc.promosList,
            childWidgetBuilder: (context, model) => PromoInfoCard(
              model: model,
            ),
          ),
        ),
      );

  Widget _buildPopularLane() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Insets.x2),
          child: SizedBox(
            height: 140,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Insets.x2),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: bloc.popularList.length,
              separatorBuilder: (context, index) => SizedBox(width: Insets.x2),
              itemBuilder: (context, index) {
                final model = bloc.popularList[index];
                return SizedBox(
                  width: 140,
                  child: PopularInfoCard(
                    model: model,
                    onTap: () {
                      bloc.add(HomeEvent.navigateToRestaurantDetail(model));
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget _buildRestaurantsList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final model = bloc.restaurantsList[index];
            return Padding(
              padding: const EdgeInsets.all(Insets.x2),
              child: RestaurantInfoCard(
                model: model,
                onTap: () {
                  bloc.add(HomeEvent.navigateToRestaurantDetail(model));
                },
              ),
            );
          },
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

  Widget _buildShimmerCarousel() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Insets.x2),
          child: HorizontalShimmerCarousel(),
        ),
      );

  Widget _buildShimmerLane() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Insets.x2),
          child: SizedBox(
            height: 140,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Insets.x2),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(width: Insets.x2),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 140,
                  child: ShimmerCard(),
                );
              },
            ),
          ),
        ),
      );

  Widget _buildShimmerList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Column(
            children: [
              SizedBox(
                height: 256,
                child: Padding(
                  padding: const EdgeInsets.all(Insets.x2),
                  child: ShimmerCard(),
                ),
              ),
            ],
          ),
          childCount: 2,
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

  Widget _buildBottomSpacingSliver() =>
      SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight));
}
