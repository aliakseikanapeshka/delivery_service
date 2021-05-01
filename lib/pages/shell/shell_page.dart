import 'dart:ui';

import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/pages/account/account_page.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/cart/cart_page.dart';
import 'package:delivery_service/pages/favorites/favorites_page.dart';
import 'package:delivery_service/pages/home/home_page.dart';
import 'package:delivery_service/pages/order_status/order_status_page.dart';
import 'package:delivery_service/pages/promo/promo_page.dart';
import 'package:delivery_service/services/navigation_service.dart';
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
        bloc: bloc,
        key: mainGlobalKey,
        builder: (_, state) {
          return Scaffold(
            backgroundColor: BrandingColors.background,
            body: Stack(
              children: [
                IndexedStack(
                  index: bloc.selectedItemIndex,
                  children: [
                    HomePage(),
                    PromoPage(),
                    CartPage(),
                    OrderStatusPage(),
                    AccountPage(),
                  ],
                ),
                _buildBottomNavigation(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: Opacity(
            opacity: 0.75,
            child: BottomNavigationWidget(
              pages: bloc.pages,
              selectedIndex: bloc.selectedItemIndex,
              pageNotificationCounts: bloc.pageNotificationCounts,
              onTappedFunction: (page) {
                bloc.add(ShellEvent.selectPage(page));
              },
            ),
          ),
        ),
      ),
    );
  }
}
