import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/app/theme/radiuses.dart';
import 'package:delivery_service/data/models/dish_model.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/widgets/scale_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishInfoCard extends StatelessWidget {
  final DishModel model;
  final double elevation;
  final double borderRadius;
  final Function() onTap;

  DishInfoCard({
    @required this.model,
    this.elevation = 0.8,
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
        Expanded(flex: 5, child: _buildImage()),
        Expanded(flex: 3, child: _buildInfo()),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
    return Padding(
      padding: EdgeInsets.all(Insets.x2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.name,
            maxLines: 2,
            style: textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            "${model.price.toStringAsFixed(2)} ${configService.getCurrency()}",
            style: textTheme.subtitle1,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
