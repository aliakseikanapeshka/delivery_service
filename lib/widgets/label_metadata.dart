import 'package:delivery_service/app/theme/insets.dart';
import 'package:flutter/cupertino.dart';

import 'info_label.dart';

class LabelMetadata extends StatelessWidget {
  final List<String> labels;

  LabelMetadata({this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: Insets.x2,
      spacing: Insets.x2,
      children: labels
          .map<Widget>(
            (labelText) => InfoLabel(
              text: labelText,
            ),
          )
          .toList(),
    );
  }
}
