import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/build_product_detail_screen_body/tab_customer_review.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/build_product_detail_screen_body/tab_description.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import '../../../../core/utils/font_and_margins.dart';

class ProductDetailTabView extends StatelessWidget {
  // final WalletViewModel walletViewModel;
  final ProductDetailViewModel productDetailViewModel;

  const ProductDetailTabView({
    Key? key,
    required this.productDetailViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
                fontSize: kMediumFont14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'helvetica'),
            unselectedLabelColor: Theme.of(context).hintColor,
            unselectedLabelStyle: TextStyle(
                fontSize: kMediumFont14.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'helvetica'),
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              SizedBox(
                  width: 60.w, height: 30.h, child: const Tab(text: "Detail")),
              SizedBox(
                  width: 60.w, height: 30.h, child: const Tab(text: "Reviews")),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth.w),
              child: TabBarView(
                children: [
                  TabDescription(
                    productDetailViewModel: productDetailViewModel,
                  ),
                  const TabCustomerReview()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
