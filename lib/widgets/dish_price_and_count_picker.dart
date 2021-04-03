import 'package:delivery_service/data/models/price.dart';
import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/theme/insets.dart';
import 'package:delivery_service/widgets/count_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';

typedef CountCallback = void Function(int count);

class DishPriceAndCountPicker extends StatefulWidget {
  final Price price;
  final CountCallback onPressed;

  DishPriceAndCountPicker({
    @required this.price,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() {
    return DishPriceAndCountPickerState();
  }
}

class DishPriceAndCountPickerState extends State<DishPriceAndCountPicker> {
  int _count = 1;
  static const _minValue = 1;
  static const _maxValue = 99;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CountPicker(
          countValue: _count,
          minValue: _minValue,
          maxValue: _maxValue,
          countPickerCallback: (count) {
            setState(() {
              _count = count;
            });
          },
        ),
        SizedBox(
          width: Insets.x12_5,
        ),
        Expanded(
          child: CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: Insets.x3_5),
            color: BrandingColors.mainButtonBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  translate(LocalizationKeys.Dish_Detail_Add),
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: BrandingColors.mainButtonContent,
                  ),
                ),
                Text(
                  "${(widget.price.value * _count).toStringAsFixed(2)} ${widget.price.currency}",
                  style: textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: BrandingColors.mainButtonContent,
                  ),
                ),
              ],
            ),
            onPressed: () => widget.onPressed.call(_count),
          ),
        ),
      ],
    );
  }
}
