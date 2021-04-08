import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/widgets/dish_price_and_count_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef AddCallback = void Function(DishModel model, int count);

class DishDetailPage extends StatelessWidget {
  final DishModel model;
  final AddCallback onPressedAdd;

  DishDetailPage({
    @required this.model,
    this.onPressedAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildImage(),
          _buildInfo(),
          Expanded(
            child: _buildPricePicker(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: model.imageUrl,
        fadeOutDuration: Duration(),
        placeholder: (context, url) => Icon(
          Icons.image,
          color: BrandingColors.placeholderIcon,
          size: Insets.x25,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    final bool hasDescription =
        model.description != null && model.description.isNotEmpty;
    final bool hasSizeInfo = model.sizeInfo != null;

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(Insets.x6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              maxLines: 2,
              style: textTheme.headline3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            if (hasDescription)
              SizedBox(
                height: Insets.x2,
              ),
            if (hasDescription)
              Text(
                model.description,
                style: textTheme.subtitle1,
              ),
            if (hasSizeInfo)
              SizedBox(
                height: Insets.x2,
              ),
            if (hasSizeInfo)
              Text(
                model.sizeInfo,
                style: textTheme.subtitle1,
                maxLines: 1,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricePicker() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(Insets.x6),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: DishPriceAndCountPicker(
            price: model.price,
            onPressed: (count) => onPressedAdd.call(model, count),
          ),
        ),
      ),
    );
  }
}
