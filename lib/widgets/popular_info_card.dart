import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/data/models/favorite_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/theme/radiuses.dart';
import 'package:delivery_service/widgets/scale_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularInfoCard extends StatelessWidget {
  final PopularModel model;
  final double elevation;
  final double borderRadius;

  PopularInfoCard({
    @required this.model,
    this.elevation = 0.8,
    this.borderRadius = Radiuses.big_1x,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: BrandingColors.background,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: _buildCardContent(),
      ),
    );
  }

  Widget _buildCardContent() {
    return Stack(
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
                BrandingColors.cardImageGradient.withOpacity(0.45),
                BrandingColors.cardImageGradient.withOpacity(0.2),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: Insets.x3,
          left: Insets.x3,
          right: Insets.x3,
          child: Text(
            model.restaurantName,
            style: textTheme.headline5.copyWith(
              color: BrandingColors.secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}