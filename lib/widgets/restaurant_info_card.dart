import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/restaurant_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/scale_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_label.dart';

class RestaurantInfoCard extends StatelessWidget {
  final RestaurantModel model;
  final double elevation;
  final double borderRadius;

  RestaurantInfoCard({
    @required this.model,
    this.elevation = 0.8,
    this.borderRadius = Radiuses.big_1x,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
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
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: BrandingColors.cardBackground,
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3, 1],
                colors: [
                  BrandingColors.cardImageGradient.withOpacity(0.3),
                  BrandingColors.cardImageGradient.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
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
            Row(
              children: [
                InfoLabel(
                  text: "${model.minDeliveryTime}-${model.maxDeliveryTime} min",
                ),
                SizedBox(
                  width: Insets.x2,
                ),
                InfoLabel(
                  text:
                      "From ${model.minOrderPrice.value} ${model.minOrderPrice.currency}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
