import 'package:delivery_service/data/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;

  CartItem({
    this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cartModel.count.toString()),
        Text(cartModel.dishModel.name),
        Text((cartModel.dishModel.price.value * cartModel.count).toString() +
            cartModel.dishModel.price.currency),
        SizedBox(height: 20),
      ],
    );
  }
}
