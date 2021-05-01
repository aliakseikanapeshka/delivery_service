import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/order_status/order_status_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key key}) : super(key: key);

  @override
  State<OrderStatusPage> createState() => _OrderStatusState();
}

class _OrderStatusState
    extends BasePageState<OrderStatusBloc, OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStatusBloc, BaseState>(
      bloc: bloc,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: BrandingColors.background,
          appBar: AppBar(
            title: Text(
              translate(LocalizationKeys.Order_Status_Title),
              style: textTheme.headline4,
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Center(),
              ],
            ),
          ),
        );
      },
    );
  }
}
