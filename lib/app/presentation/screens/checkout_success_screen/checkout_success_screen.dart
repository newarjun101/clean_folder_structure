import 'package:flutter/material.dart';
import 'package:hive_innovation_shop/app/presentation/screens/checkout_success_screen/build_checkout_success_screen_body/build_checkout_success_screen_body.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildCheckoutSuccessScreenBody(),
    );
  }
}
