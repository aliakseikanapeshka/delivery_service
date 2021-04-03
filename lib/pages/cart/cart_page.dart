import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/widgets/cart_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, BaseState>(
      cubit: bloc,
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: _getContentSlivers(),
        ),
      );
    }
  }

  Widget _buildEmptyCart() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: Insets.x12_5),
        Image.asset(
          "assets/gif/empty_cart2.gif",
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
        _buildDishList(),
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

  Widget _buildBottomSpacingSliver() =>
      SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight));
}
