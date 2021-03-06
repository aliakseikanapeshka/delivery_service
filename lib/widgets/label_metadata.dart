import 'package:delivery_service/theme/insets.dart';
import 'package:flutter/cupertino.dart';

import 'info_label.dart';

class LabelMetadata extends StatelessWidget {
  final List<String> labels;

  LabelMetadata({this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Insets.x2,
      children: labels.map<Widget>(
        (labelText) => InfoLabel(
          text: labelText,
        ),
      ).toList(),
    );
  }
}
