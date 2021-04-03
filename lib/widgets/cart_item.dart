import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/cart_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/count_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef UpdateCountCallback = void Function(int count);
typedef RemoveCallback = void Function();

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  final UpdateCountCallback updateCountCallback;
  final RemoveCallback removeCallback;

  CartItem({
    @required this.cartItemModel,
    this.updateCountCallback,
    this.removeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartItemModel.toString()),
      onDismissed: (direction) {
        if (removeCallback != null) {
          removeCallback.call();
        }
      },
      direction: DismissDirection.endToStart,
      background: Container(
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
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Radiuses.big_1x),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: cartItemModel.dishModel.imageUrl,
                      fadeOutDuration: Duration(),
                      placeholder: (context, url) => Icon(
                        Icons.image,
                        color: BrandingColors.placeholderIcon,
                        size: Insets.x25,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                            top: 6,
                          ),
                          child: Text(
                            cartItemModel.dishModel.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Transform.scale(
                            scale: 0.7,
                            alignment: Alignment.centerLeft,
                            child: CountPicker(
                              countValue: cartItemModel.count,
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
                                padding: const EdgeInsets.only(right: 12),
                                child: Text(
                                  (cartItemModel.dishModel.price.value *
                                              cartItemModel.count)
                                          .toStringAsFixed(2) +
                                      " " +
                                      cartItemModel.dishModel.price.currency,
                                  style: textTheme.subtitle1,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
