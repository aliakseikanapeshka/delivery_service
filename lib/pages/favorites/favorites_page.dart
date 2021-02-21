import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/widgets/restaurant_info_card.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'favorites_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends BasePageState<FavoritesBloc, FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, BaseState>(
      cubit: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(
              translate(LocalizationKeys.Favorites_Title),
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
        _buildShimmerList(),
        _buildBottomSpacingSliver(),
      ];

  List<Widget> _getContentSlivers() => [
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 170,
          onRefresh: () async => bloc.add(BaseEvent.refresh()),
        ),
        if (bloc.favoritesList.isNotEmpty) _buildFavoritesList(),
        _buildBottomSpacingSliver(),
      ];

  Widget _buildFavoritesList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.92,
                child: RestaurantInfoCard(
                  model: bloc.favoritesList[index],
                ),
              ),
              SizedBox(height: Insets.x2),
            ],
          ),
          childCount: bloc.favoritesList.length,
        ),
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
          childCount: 4,
        ),
      );

  Widget _buildBottomSpacingSliver() =>
      SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight));
}
