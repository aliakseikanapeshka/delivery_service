import 'package:delivery_service/pages/account/account_page.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/home/home_page.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:delivery_service/theme/branding_colors.dart';
import 'package:delivery_service/widgets/bottom_navigation/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shell_bloc.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({Key key}) : super(key: key);

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends BasePageState<ShellBloc, ShellPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShellBloc>(
      create: (context) => bloc,
      child: BlocBuilder<ShellBloc, BaseState>(
        cubit: bloc,
        key: mainGlobalKey,
        builder: (_, state) {
          return Scaffold(
            backgroundColor: BrandingColors.background,
            body: IndexedStack(
              index: bloc.selectedItemIndex,
              children: [
                HomePage(),
                AccountPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationWidget(
              selectedIndex: bloc.selectedItemIndex,
              pages: bloc.pages,
              onTappedFunction: (page) => bloc.add(ShellEvent.selectPage(page)),
            ),
          );
        },
      ),
    );
  }
}
