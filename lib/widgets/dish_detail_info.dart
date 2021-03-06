import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishDetailInfo extends StatelessWidget {
  final DishModel model;

  DishDetailInfo({
    @required this.model,
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
    final bool hasWeight = model.weight != null;

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
            if (hasWeight)
              SizedBox(
                height: Insets.x2,
              ),
            if (hasWeight)
              Text(
                "${model.weight} g",
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
          alignment: Alignment.bottomRight,
          child: Text(
            model.price,
            style: textTheme.headline1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
