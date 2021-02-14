import 'package:delivery_service/pages/shell/shell_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';

import 'file:///C:/Users/Professional/Documents/Workspace/delivery_service/lib/theme/theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: ThemeProvider.getTheme(),
      locale: localizationDelegate.currentLocale,
      supportedLocales: localizationDelegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        localizationDelegate
      ],
      home: ShellPage(),
    );
  }
}
