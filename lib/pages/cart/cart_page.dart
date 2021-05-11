import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/assets.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/widgets/cart_item.dart';
import 'package:delivery_service/widgets/label_metadata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends BasePageState<CartBloc, CartPage> {
  static const _bottomSpacing = 80;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, BaseState>(
      bloc: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(
              translate(LocalizationKeys.Cart_Title),
              style: textTheme.headline4,
            ),
          ),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    if (bloc.cartItems.isEmpty) {
      return SafeArea(
        child: _buildEmptyCart(),
      );
    } else {
      return SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: _getContentSlivers(),
            ),
            Positioned(
              bottom: kBottomNavigationBarHeight + Insets.x5,
              right: Insets.x6,
              left: Insets.x6,
              child: _buildOrderButton(),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildOrderButton() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: Insets.x6),
      color: BrandingColors.mainButtonBackground,
      onPressed: () {
        bloc.add(CartEvent.openOrderPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.payment,
                color: BrandingColors.mainButtonContent,
              ),
              SizedBox(width: Insets.x2),
              Text(
                translate(LocalizationKeys.Cart_Next),
                style: textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: BrandingColors.mainButtonContent,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${(bloc.totalCartPrice + bloc.restaurantModel.deliveryPrice).toStringAsFixed(2)} ${configService.getCurrency()}",
                style: textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: BrandingColors.mainButtonContent,
                ),
              ),
              SizedBox(width: Insets.x2),
              Icon(
                Icons.arrow_forward,
                color: BrandingColors.mainButtonContent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: Insets.x12_5),
        Image.asset(
          Assets.gif_empty_cart,
          height: 290.0,
          width: 290.0,
        ),
        SizedBox(height: Insets.x3),
        Text(
          translate(LocalizationKeys.Cart_Empty_Title),
          textAlign: TextAlign.center,
          style: textTheme.headline4,
        ),
        SizedBox(height: Insets.x3_5),
        Text(
          translate(LocalizationKeys.Cart_Empty_Body),
          textAlign: TextAlign.center,
          style: textTheme.subtitle2,
        ),
        SizedBox(height: Insets.x12_5),
      ],
    );
  }

  List<Widget> _getContentSlivers() => [
        _buildRestaurantInfo(),
        _buildDishList(),
        _buildOrderPriceInfo(),
        _buildBottomSpacingSliver(),
      ];

  Widget _buildDishList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final model = bloc.cartItems[index];
            return CartItem(
              cartModel: model,
              updateCountCallback: (count) {
                bloc.add(CartEvent.updateDishCount(model.dishModel, count));
              },
              removeCallback: () {
                bloc.add(CartEvent.removeDish(model.dishModel));
              },
            );
          },
          childCount: cartService.dishAndCountMap.length,
        ),
      );

  Widget _buildRestaurantInfo() {
    final RestaurantModel model = bloc.restaurantModel;

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

  Widget _buildOrderPriceInfo() {
    final orderPriceList = {
      translate(LocalizationKeys.Cart_Total_Cart_Price):
          "${bloc.totalCartPrice.toStringAsFixed(2)} ${configService.getCurrency()}",
      translate(LocalizationKeys.Cart_Delivery_Price):
          "${bloc.restaurantModel.deliveryPrice.toStringAsFixed(2)} ${configService.getCurrency()}",
      translate(LocalizationKeys.Cart_Total_Order_Price):
          "${(bloc.totalCartPrice + bloc.restaurantModel.deliveryPrice).toStringAsFixed(2)} ${configService.getCurrency()}",
    }
        .entries
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: Insets.x1_5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  e.key,
                  style: textTheme.bodyText1,
                  maxLines: 1,
                ),
                Text(
                  e.value,
                  style: textTheme.subtitle1,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        )
        .toList();

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(Insets.x4_5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: orderPriceList,
        ),
      ),
    );
  }

  Widget _buildBottomSpacingSliver() => SliverToBoxAdapter(
      child: SizedBox(height: kBottomNavigationBarHeight + _bottomSpacing));
}
