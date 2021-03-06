import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/restaurant_detail/restaurant_detail_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/widgets/dish_detail_info.dart';
import 'package:delivery_service/widgets/dish_info_card.dart';
import 'package:delivery_service/widgets/label_metadata.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RestaurantDetailPage extends StatefulWidget {
  final RestaurantModel restaurantModel;

  const RestaurantDetailPage({
    @required this.restaurantModel,
    Key key,
  }) : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState
    extends BasePageState<RestaurantDetailBloc, RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    _setInitialDataToBloc();
    return BlocBuilder<RestaurantDetailBloc, BaseState>(
      cubit: bloc,
      builder: (_, state) {
        return CupertinoScaffold(
          body: _buildBody(state),
        );
      },
    );
  }

  _setInitialDataToBloc() {
    bloc.add(RestaurantEvent.setInitialData(widget.restaurantModel));
  }

  Widget _buildBody(BaseState state) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: BrandingColors.background,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildRestaurantInfo(),
          _buildItemsGrid(state),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 240,
      backgroundColor: BrandingColors.background.withOpacity(0.8),
      shadowColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.restaurantModel.imageUrl,
                fadeOutDuration: Duration(),
                placeholder: (context, url) => Icon(
                  Icons.image,
                  color: BrandingColors.placeholderIcon,
                  size: Insets.x25,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.2, 0.5],
                  colors: [
                    BrandingColors.background,
                    BrandingColors.background.withOpacity(0.35),
                    BrandingColors.background.withOpacity(0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    final RestaurantModel model = widget.restaurantModel;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(Insets.x4_5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: Insets.x4_5,
            ),
            LabelMetadata(
              labels: [
                model.deliveryTime,
                model.minOrderPrice,
                model.deliveryPrice,
                model.workTime,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsGrid(BaseState state) {
    if (state is ProgressState) {
      return _buildShimmerGrid();
    } else if (state is SuccessState) {
      return _buildDishGrid();
    } else {
      return SliverToBoxAdapter();
    }
  }

  Widget _buildDishGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(Insets.x2),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: Insets.x2,
          mainAxisSpacing: Insets.x2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = bloc.dishList[index];
            return DishInfoCard(
              model: model,
              onTap: () {
                CupertinoScaffold.showCupertinoModalBottomSheet(
                  context: context,
                  backgroundColor: BrandingColors.cardBackground,
                  builder: (_) {
                    return DishDetailInfo(
                      model: model,
                    );
                  },
                );
              },
            );
          },
          childCount: bloc.dishList.length,
        ),
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(Insets.x2),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: Insets.x2,
          mainAxisSpacing: Insets.x2,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) => ShimmerCard(),
          childCount: 6,
        ),
      ),
    );
  }
}
