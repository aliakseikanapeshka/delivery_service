import 'dart:async';

import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/assets.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/data/models/order_status.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/order_status/order_status_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key key}) : super(key: key);

  @override
  State<OrderStatusPage> createState() => _OrderStatusState();
}

class _OrderStatusState
    extends BasePageState<OrderStatusBloc, OrderStatusPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _textEditingController.dispose();
  }

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
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: _buildInfo(state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfo(BaseState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: _buildStatusInfo(state),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Insets.x6, vertical: Insets.x5),
          child: _buildFindInputAndButton(),
        ),
        SizedBox(height: kBottomNavigationBarHeight),
      ],
    );
  }

  Widget _buildStatusInfo(BaseState state) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Image.asset(
            _getStatusAsset(state),
            height: 200.0,
            width: 200.0,
          ),
          Text(
            translate(_getHeaderKey(state)),
            textAlign: TextAlign.center,
            style: textTheme.headline4,
          ),
          SizedBox(height: Insets.x2),
          Text(
            translate(_getBodyKey(state)),
            textAlign: TextAlign.center,
            style: textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  Widget _buildFindInputAndButton() {
    return Column(
      children: [
        TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          autofocus: false,
          cursorColor: BrandingColors.primary,
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: "Order id",
            labelStyle: TextStyle(color: BrandingColors.primary),
            hintStyle: TextStyle(color: BrandingColors.primary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: BrandingColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: BrandingColors.primary),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: BrandingColors.primary),
            ),
          ),
        ),
        SizedBox(height: Insets.x2),
        CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: Insets.x6),
          color: BrandingColors.mainButtonBackground,
          onPressed: () {
            bloc.add(OrderStatusEvent.findOrderStatus(
                _textEditingController.value.text));
          },
          child: Text(
            "Find order",
            style: textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
              color: BrandingColors.mainButtonContent,
            ),
          ),
        ),
      ],
    );
  }

  String _getStatusAsset(BaseState state) {
    if (state is InitialState) {
      return Assets.gif_search;
    } else {
      switch (bloc.orderStatus) {
        case OrderStatus.processing:
          return Assets.gif_processing;
        case OrderStatus.cooking:
          return Assets.gif_cooking;
        case OrderStatus.delivering:
          return Assets.gif_delivering;
        case OrderStatus.done:
          return Assets.gif_done;
        case OrderStatus.unknown:
        default:
          return Assets.gif_no_result;
      }
    }
  }

  String _getHeaderKey(BaseState state) {
    if (state is InitialState) {
      return LocalizationKeys.Order_Status_Header_Search;
    } else {
      switch (bloc.orderStatus) {
        case OrderStatus.processing:
          return LocalizationKeys.Order_Status_Header_Processing;
        case OrderStatus.cooking:
          return LocalizationKeys.Order_Status_Header_Cooking;
        case OrderStatus.delivering:
          return LocalizationKeys.Order_Status_Header_Delivering;
        case OrderStatus.done:
          return LocalizationKeys.Order_Status_Header_Done;
        case OrderStatus.unknown:
        default:
          return LocalizationKeys.Order_Status_Header_No_Result;
      }
    }
  }

  String _getBodyKey(BaseState state) {
    if (state is InitialState) {
      return LocalizationKeys.Order_Status_Body_Search;
    } else {
      switch (bloc.orderStatus) {
        case OrderStatus.processing:
          return LocalizationKeys.Order_Status_Body_Processing;
        case OrderStatus.cooking:
          return LocalizationKeys.Order_Status_Body_Cooking;
        case OrderStatus.delivering:
          return LocalizationKeys.Order_Status_Body_Delivering;
        case OrderStatus.done:
          return LocalizationKeys.Order_Status_Body_Done;
        case OrderStatus.unknown:
        default:
          return LocalizationKeys.Order_Status_Body_No_Result;
      }
    }
  }
}
