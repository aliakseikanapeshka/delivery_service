import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CountPickerCallback = void Function(int count);
typedef CountPickerMinReachedCallback = void Function();

class CountPicker extends StatelessWidget {
  final int countValue;
  final int minValue;
  final int maxValue;
  final CountPickerCallback countPickerCallback;
  final CountPickerMinReachedCallback minReachedCallback;

  CountPicker({
    @required this.countValue,
    @required this.minValue,
    @required this.maxValue,
    this.countPickerCallback,
    this.minReachedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: Insets.x2_5),
          color: BrandingColors.minorButtonBackground,
          child: Icon(
            Icons.remove,
            color: BrandingColors.minorButtonContent,
          ),
          onPressed: () {
            if (countValue > minValue) {
              if (countPickerCallback != null) {
                countPickerCallback.call(countValue - 1);
              }
            } else {
              if (minReachedCallback != null) {
                minReachedCallback.call();
              }
            }
          },
        ),
        SizedBox(
          width: Insets.x10,
          child: Text(
            countValue.toString(),
            textAlign: TextAlign.center,
            style: textTheme.headline6,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: Insets.x2_5),
          color: BrandingColors.minorButtonBackground,
          child: Icon(
            Icons.add,
            color: BrandingColors.minorButtonContent,
          ),
          onPressed: () {
            if (countValue < maxValue) {
              if (countPickerCallback != null) {
                countPickerCallback.call(countValue + 1);
              }
            }
          },
        ),
      ],
    );
  }
}
