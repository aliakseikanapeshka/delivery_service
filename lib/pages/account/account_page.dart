import 'package:delivery_service/localization/localization_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';

class AccountPage extends StatelessWidget {
  AccountPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(LocalizationKeys.Account_Title)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: Text(translate(LocalizationKeys.Account_Content))),
          ],
        ),
      ),
    );
  }
}
