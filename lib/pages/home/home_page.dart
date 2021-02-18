import 'package:delivery_service/localization/localization_keys.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomeBloc, HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, BaseState>(
      cubit: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(translate(LocalizationKeys.Home_Title)),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text(translate(LocalizationKeys.Home_Content))),
              ],
            ),
          ),
        );
      },
    );
  }
}
