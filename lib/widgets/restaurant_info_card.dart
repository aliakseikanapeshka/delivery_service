import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/scale_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'label_metadata.dart';

class RestaurantInfoCard extends StatelessWidget {
  final RestaurantModel model;
  final double elevation;
  final double borderRadius;
  final Function() onTap;

  RestaurantInfoCard({
    @required this.model,
    this.elevation = 0.9,
    this.borderRadius = Radiuses.big_1x,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        shadowColor: BrandingColors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    return Column(
      children: [
        _buildImage(),
        _buildInfo(),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 160,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: BrandingColors.cardBackgroundDark,
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
      ),
    );
  }

  Widget _buildInfo() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(Insets.x4_5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: textTheme.headline3,
            ),
            SizedBox(
              height: Insets.x1,
            ),
            LabelMetadata(
              labels: [
                model.deliveryTime,
                model.minOrderPrice,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
