import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: BrandingColors.primary,
      backgroundColor: BrandingColors.background,
      cursorColor: BrandingColors.primary,
      shadowColor: BrandingColors.background,
      appBarTheme: const AppBarTheme(
        color: BrandingColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        button: _TextStyles.button,
        caption: _TextStyles.caption,
        overline: _TextStyles.overline,
        headline1: _TextStyles.headline1,
        headline2: _TextStyles.headline2,
        headline3: _TextStyles.headline3,
        headline4: _TextStyles.headline4,
        headline5: _TextStyles.headline5,
        headline6: _TextStyles.headline6,
        subtitle1: _TextStyles.subtitle1,
        subtitle2: _TextStyles.subtitle2,
        bodyText1: _TextStyles.bodyText1,
        bodyText2: _TextStyles.bodyText2,
      ),
    );
  }
}

class _TextStyles {
  static final _baseFont = GoogleFonts.openSans();

  static final headline1 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_5x,
    fontWeight: FontWeight.w600,
  );

  static final headline2 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_4x,
    fontWeight: FontWeight.w600,
  );

  static final headline3 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_3x,
    fontWeight: FontWeight.w600,
  );

  static final headline4 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_2x,
    fontWeight: FontWeight.w600,
  );

  static final headline5 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_2x,
    fontWeight: FontWeight.w500,
  );

  static final headline6 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.big_1x,
    fontWeight: FontWeight.normal,
  );

  static final subtitle1 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.normal,
    fontWeight: FontWeight.normal,
  );

  static final subtitle2 = _baseFont.copyWith(
    color: BrandingColors.primaryText.withOpacity(0.7),
    fontSize: FontSizes.normal,
    fontWeight: FontWeight.w300,
  );

  static final bodyText1 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.normal,
    fontWeight: FontWeight.w500,
  );

  static final bodyText2 = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.small_1x,
    fontWeight: FontWeight.normal,
  );

  static final button = _baseFont.copyWith(
    color: BrandingColors.primaryText.withOpacity(0.9),
    fontSize: FontSizes.big_1x,
    fontWeight: FontWeight.w500,
  );

  static final caption = _baseFont.copyWith(
    color: BrandingColors.primaryText,
    fontSize: FontSizes.small_2x,
    fontWeight: FontWeight.normal,
  );

  static final overline = _baseFont.copyWith(
    color: BrandingColors.primaryText.withOpacity(0.6),
    fontSize: FontSizes.small_2x,
    fontWeight: FontWeight.w500,
  );
}
