import 'package:delivery_service/theme/branding_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.colorDodge,
        color: BrandingColors.background.withOpacity(0.6),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(BrandingColors.primary),
        ),
      ),
    );
  }
}
