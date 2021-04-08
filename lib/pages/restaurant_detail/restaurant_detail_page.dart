import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/app/theme/radiuses.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/dish_detail/dish_detail_page.dart';
import 'package:delivery_service/pages/restaurant_detail/restaurant_detail_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/widgets/dish_info_card.dart';
import 'package:delivery_service/widgets/label_metadata.dart';
import 'package:delivery_service/widgets/shimmer_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';
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
    return BlocConsumer<RestaurantDetailBloc, BaseState>(
      cubit: bloc,
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: (_, state) => _buildBody(state),
      listener: (context, state) => _handleState(context, state),
    );
  }

  _setInitialDataToBloc() {
    bloc.add(RestaurantEvent.setInitialData(widget.restaurantModel));
  }

  BlocBuilderCondition<BaseState> _buildWhen = (previous, current) {
    return current is InitialState ||
        current is ProgressState ||
        current is SuccessState ||
        current is ErrorState;
  };

  BlocListenerCondition<BaseState> _listenWhen = (previous, current) {
    return current is ShowClearCartDialogState ||
        current is ShowDishAddedDialogState;
  };

  _handleState(BuildContext context, BaseState state) {
    if (state is ShowClearCartDialogState) {
      _showClearCartDialog(context, state);
    } else if (state is ShowDishAddedDialogState) {
      _showDishAddedDialog(context);
    }
  }

  _showClearCartDialog(BuildContext context, ShowClearCartDialogState state) {
    AwesomeDialog(
      context: context,
      width: 300,
      headerAnimationLoop: false,
      showCloseIcon: false,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(Radiuses.big_1x)),
      padding: EdgeInsets.all(Insets.x2),
      animType: AnimType.SCALE,
      dialogType: DialogType.QUESTION,
      title: translate(LocalizationKeys.Dialog_Header_Type_1),
      desc: translate(LocalizationKeys.Dialog_Body_Type_1),
      btnCancel: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: Insets.x3_5),
        color: BrandingColors.minorButtonBackground,
        child: Text(
          translate(LocalizationKeys.Dialog_Cancel),
          style: textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.bold,
            color: BrandingColors.minorButtonContent,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      btnOk: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: Insets.x3_5),
        color: BrandingColors.mainButtonBackground,
        child: Text(
          translate(LocalizationKeys.Dialog_Ok),
          style: textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.bold,
            color: BrandingColors.mainButtonContent,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          bloc.add(RestaurantEvent.forceAddDishToCart(
            state.dishModel,
            state.count,
          ));
        },
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  _showDishAddedDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      width: 300,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(Radiuses.big_1x)),
      padding: EdgeInsets.all(Insets.x2),
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      title: translate(LocalizationKeys.Dialog_Header_Type_2),
      desc: translate(LocalizationKeys.Dialog_Body_Type_2),
      btnOk: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: Insets.x3_5),
        color: BrandingColors.mainButtonBackground,
        child: Text(
          translate(LocalizationKeys.Dialog_Ok),
          style: textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.bold,
            color: BrandingColors.mainButtonContent,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      btnOkOnPress: () {},
    )..show();
  }

  Widget _buildBody(BaseState state) {
    return CupertinoScaffold(
      body: Container(
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
                "${translate(LocalizationKeys.Restaurant_Order_From)} ${model.minOrderPrice} ${configService.getCurrency()}",
                "${translate(LocalizationKeys.Restaurant_Delivery_Price)} ${model.deliveryPrice} ${configService.getCurrency()}",
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
                _showDishDetailBottomSheet(context, model);
              },
            );
          },
          childCount: bloc.dishList.length,
        ),
      ),
    );
  }

  _showDishDetailBottomSheet(BuildContext context, DishModel model) {
    CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: BrandingColors.cardBackground,
      builder: (_) {
        return DishDetailPage(
          model: model,
          onPressedAdd: (model, count) {
            Navigator.of(context).pop();
            bloc.add(RestaurantEvent.tryAddDishToCart(
              model,
              count,
            ));
          },
        );
      },
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
