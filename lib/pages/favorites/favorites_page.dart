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

  Widget _buildBody(BaseState state) =>
      SafeArea(child: _getContentFromState(state));

  Widget _getContentFromState(BaseState state) {
    if (state is InitialState) {
      return _getShimmerContent();
    } else {
      return _getContent();
    }
  }

  Widget _getContent() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: bloc.favoritesList.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: Insets.x2),
      itemBuilder: (context, index) {
        if (index != bloc.favoritesList.length) {
          return FractionallySizedBox(
            widthFactor: 0.92,
            child: RestaurantInfoCard(
              model: bloc.favoritesList[index],
            ),
          );
        } else {
          return _buildBottomSpacing();
        }
      },
    );
  }

  Widget _getShimmerContent() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (context, index) => SizedBox(height: Insets.x2),
      itemBuilder: (context, index) {
        if (index != 5) {
          return SizedBox(
            height: 256,
            child: FractionallySizedBox(
              widthFactor: 0.92,
              child: ShimmerCard(),
            ),
          );
        } else {
          return _buildBottomSpacing();
        }
      },
    );
  }

  Widget _buildBottomSpacing() => SizedBox(height: kBottomNavigationBarHeight);
}
