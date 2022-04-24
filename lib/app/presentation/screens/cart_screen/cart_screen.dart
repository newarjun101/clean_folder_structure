import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/simple_app_bar_with_back_arrow.dart';
import 'package:hive_innovation_shop/app/view_model/cart_view_model.dart';

import 'build_cart_screen_body/build_cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Get.find<CartViewModel>();
    return Scaffold(
      appBar: const SimpleAppBarWithBackArrow(
        title: "Cart",
      ),
      body: BuildCartScreenBody(cartViewModel: cartViewModel),
    );
  }
}
