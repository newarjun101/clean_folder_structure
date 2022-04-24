import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_button.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';

import 'build_product_detail_screen_body/build_product_detail_body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    final productDetailVM = Get.find<ProductDetailViewModel>();
    productDetailVM.getProductDetail(product: argument);
    return Scaffold(
      body: BuildProductDetailBody(
        productDetailVM: productDetailVM,
      ),
      bottomNavigationBar: CustomContainer(
        radius: 0,
        height: 100.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextView(
                title: productDetailVM.mProductDetail[0].amount.toString(),
                fontSize: kLargestFont22.sp,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(
                width: 16.w,
              ),
              SizedBox(
                width: 0.5.sw,
                child: CustomButton(
                  buttonText: "Add To Cart",
                  onClick: () =>
                      productDetailVM.addToCart(product: argument, count: 1),
                  buttonTextColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  buttonColor: Theme.of(context).primaryColor,
                  radius: 4.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
