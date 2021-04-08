import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';

class TextThemeExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Insets.x1),
        Text("Headline1", style: textTheme.headline1),
        SizedBox(height: Insets.x1),
        Text("Headline2", style: textTheme.headline2),
        SizedBox(height: Insets.x1),
        Text("Headline3", style: textTheme.headline3),
        SizedBox(height: Insets.x1),
        Text("Headline4", style: textTheme.headline4),
        SizedBox(height: Insets.x1),
        Text("Headline5", style: textTheme.headline5),
        SizedBox(height: Insets.x1),
        Text("Headline6", style: textTheme.headline6),
        SizedBox(height: Insets.x1),
        Text("Subtitle1", style: textTheme.subtitle1),
        SizedBox(height: Insets.x1),
        Text("Subtitle2", style: textTheme.subtitle2),
        SizedBox(height: Insets.x1),
        Text("BodyText1", style: textTheme.bodyText1),
        SizedBox(height: Insets.x1),
        Text("BodyText2", style: textTheme.bodyText2),
        SizedBox(height: Insets.x1),
        Text("Button", style: textTheme.button),
        SizedBox(height: Insets.x1),
        Text("Caption", style: textTheme.caption),
        SizedBox(height: Insets.x1),
        Text("Overline", style: textTheme.overline),
        SizedBox(height: Insets.x1),
      ],
    );
  }
}
