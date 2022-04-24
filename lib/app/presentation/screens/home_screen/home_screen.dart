import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/app_bar_with_cart_icon.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/view_model/home_screen_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'build_home_screen_body/build_home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeScreenViewModel>();
    homeViewModel.getProduct(page: homeViewModel.page.value);

    return Scaffold(
      appBar: AppBarWithCartIcon(
        title: 'Home',
        leadingIcon: "assets/images/drawer_icon.svg",
        onClick: () => homeViewModel.routeToCartScreen(),
        count: homeViewModel.mTotalCart,
        logout: () => homeViewModel.onLogoutClick(),
        onDrawerClick: () => homeViewModel.onDrawerIconClick(),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: homeViewModel.refreshController,
          onRefresh: () =>
              homeViewModel.getProduct(page: homeViewModel.page.value),
          onLoading: homeViewModel.onLoad,
          /*      footer: CustomFooter(
            builder: (_,mode) {

              return mode == LoadStatus.idle? const Text("initial state") :
              mode == LoadStatus.loading ? const Center(child: CircularProgressIndicator()) :
              mode == LoadStatus.failed? TextView(title: "Load Fail", fontSize: kMediumFont14.sp) :
              mode == LoadStatus.canLoading? Center(child: TextView(title: "Load Data", fontSize: kMediumFont14.sp)):
              TextView(title: "No More Data", fontSize: kMediumFont14.sp);
            }
          ),*/
          child: Obx(() => homeViewModel.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : homeViewModel.isError.isTrue
                  ? TextView(
                      title: homeViewModel.message.value,
                      fontSize: kLargeFont16.sp)
                  : BuildHomeScreenBody(
                      homeScreenViewModel: homeViewModel,
                    ))),
    );
  }
}
