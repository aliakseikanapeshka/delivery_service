import 'package:delivery_service/app/localization/localization_keys.dart';
import 'package:delivery_service/app/theme/branding_colors.dart';
import 'package:delivery_service/app/theme/insets.dart';
import 'package:delivery_service/pages/base/base_bloc.dart';
import 'package:delivery_service/pages/base/base_page_state.dart';
import 'package:delivery_service/pages/order_page/order_bloc.dart';
import 'package:delivery_service/services/registry_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderState();
}

class _OrderState extends BasePageState<OrderBloc, OrderPage> {
  String _paymentTypeDropdownValue = 'Cash to the courier';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _promoCodeController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _personsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _promoCodeController.dispose();
    _commentController.dispose();
    _personsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, BaseState>(
      bloc: bloc,
      builder: (_, state) => _buildBody(state),
    );
  }

  Widget _buildBody(BaseState state) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: BrandingColors.background,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  SizedBox(height: Insets.x7_5),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Name),
                    TextInputType.text,
                    _nameController,
                  ),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Email),
                    TextInputType.emailAddress,
                    _emailController,
                  ),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Phone),
                    TextInputType.phone,
                    _phoneController,
                  ),
                  SizedBox(height: Insets.x15),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Address),
                    TextInputType.text,
                    _addressController,
                  ),
                  SizedBox(height: Insets.x15),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Promo_Code),
                    TextInputType.text,
                    _promoCodeController,
                  ),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Persons),
                    TextInputType.numberWithOptions(),
                    _personsController,
                  ),
                  _buildInputField(
                    translate(LocalizationKeys.Order_Comment),
                    TextInputType.text,
                    _commentController,
                  ),
                  _buildPaymentTypeDropdown(),
                  SizedBox(height: Insets.x7_5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.x6),
                    child: _buildOrderButton(),
                  ),
                  SizedBox(height: Insets.x7_5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.x3,
      ),
      child: Text(
        translate(LocalizationKeys.Order_Title),
        style: textTheme.headline1,
      ),
    );
  }

  Widget _buildPaymentTypeDropdown() {
    return Container(
      alignment: Alignment.centerLeft,
      height: Insets.x15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrandingColors.white,
        border: Border(
          bottom: BorderSide(
            color: BrandingColors.underline,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.x1,
          horizontal: Insets.x3,
        ),
        child: DropdownButton<String>(
          value: _paymentTypeDropdownValue,
          elevation: 16,
          style: const TextStyle(color: BrandingColors.primaryText),
          onChanged: (String newValue) {
            setState(() {
              _paymentTypeDropdownValue = newValue;
            });
          },
          underline: Container(
            height: 0,
            color: Colors.transparent,
          ),
          items: <String>[
            'Cash to the courier',
            'By card to the courier',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: BrandingColors.background.withOpacity(0.8),
      shadowColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      stretch: true,
    );
  }

  Widget _buildInputField(
    String label,
    TextInputType keyboardType,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: BrandingColors.white,
        border: Border(
          bottom: BorderSide(
            color: BrandingColors.underline,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.x1,
          horizontal: Insets.x3,
        ),
        child: TextFormField(
          maxLines: 1,
          keyboardType: keyboardType,
          autofocus: false,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          cursorColor: BrandingColors.primary,
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: BrandingColors.primaryText),
            hintStyle: TextStyle(color: BrandingColors.primaryText),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderButton() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: Insets.x6),
      color: BrandingColors.mainButtonBackground,
      onPressed: () {
        bloc.add(OrderEvent.makeOrderEvent(
          persons: int.tryParse(_personsController.value.text),
          phone: _phoneController.value.text,
          paymentType: _paymentTypeDropdownValue,
          promoCode: _promoCodeController.value.text,
          name: _nameController.value.text,
          email: _emailController.value.text,
          comment: _commentController.value.text,
          address: _addressController.value.text,
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.payment,
                color: BrandingColors.mainButtonContent,
              ),
              SizedBox(width: Insets.x2),
              Text(
                translate(LocalizationKeys.Order_Make_Order),
                style: textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: BrandingColors.mainButtonContent,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${(bloc.totalCartPrice + bloc.restaurantModel.deliveryPrice).toStringAsFixed(2)} ${configService.getCurrency()}",
                style: textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: BrandingColors.mainButtonContent,
                ),
              ),
              SizedBox(width: Insets.x2),
              Icon(
                Icons.check,
                color: BrandingColors.mainButtonContent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
