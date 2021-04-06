import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/cart_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'count_picker.dart';

typedef UpdateCountCallback = void Function(int count);
typedef RemoveCallback = void Function();

class CartItem extends StatelessWidget {
  final CartModel cartModel;
  final UpdateCountCallback updateCountCallback;
  final RemoveCallback removeCallback;

  CartItem({
    @required this.cartModel,
    this.updateCountCallback,
    this.removeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartModel.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (removeCallback != null) {
          removeCallback.call();
        }
      },
      background: _buildSwipeToDeleteBackground(),
      child: _buildContent(),
    );
  }

  Widget _buildSwipeToDeleteBackground() {
    return Container(
      color: BrandingColors.negativeBackground,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(Insets.x4),
          child: Icon(
            Icons.delete_outline,
            color: BrandingColors.secondaryText,
            size: Insets.x8,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.x1_5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage(),
            Expanded(
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.x3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Radiuses.big_1x),
        child: CachedNetworkImage(
          height: Insets.x25,
          width: Insets.x25,
          fit: BoxFit.cover,
          imageUrl: cartModel.dishModel.imageUrl,
          fadeOutDuration: Duration(),
          placeholder: (context, url) => Icon(
            Icons.image,
            color: BrandingColors.placeholderIcon,
            size: Insets.x25,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        Expanded(
          child: _buildTitle(),
        ),
        _buildPriceAndCount(),
      ],
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          right: Insets.x3,
          top: Insets.x1_5,
        ),
        child: Text(
          cartModel.dishModel.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildPriceAndCount() {
    final price = cartModel.dishModel.price * cartModel.count;
    final priceString =
        price.toStringAsFixed(2) + " " + configService.getCurrency();

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Transform.scale(
            scale: 0.7,
            alignment: Alignment.centerLeft,
            child: CountPicker(
              countValue: cartModel.count,
              minValue: 1,
              maxValue: 99,
              countPickerCallback: updateCountCallback,
              minReachedCallback: removeCallback,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: Insets.x3),
                child: Text(
                  priceString,
                  style: textTheme.subtitle1,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
