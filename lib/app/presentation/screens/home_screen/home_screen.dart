import 'package:flutter/material.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/app_bar_with_cart_icon.dart';

import 'build_home_screen_body/build_home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithCartIcon(title: 'Home', leadingIcon: "assets/images/drawer_icon.svg", onClick: () =>print("Dilu"), count: 0,),
      body: const BuildHomeScreenBody(),
    );
  }
}
