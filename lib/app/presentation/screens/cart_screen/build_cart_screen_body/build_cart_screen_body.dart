import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/persistance/cart_db.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_button.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/presentation/screens/cart_screen/build_cart_screen_body/cart_product_list_view.dart';

import '../../../../view_model/cart_view_model.dart';
import '../../../../view_model/home_screen_view_model.dart';

class BuildCartScreenBody extends StatelessWidget {
  final CartViewModel cartViewModel;

  const BuildCartScreenBody({Key? key, required this.cartViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth.w),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 16.h,
            ),
            TextView(
              title: "Delivery To",
              fontSize: kLargeFont16.sp,
              fontWeight: FontWeight.bold,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: kDefaultMarginHeight.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.h),
                  border: Border.all(
                    color: Theme.of(context).hintColor.withOpacity(0.4),
                  )),
              padding: EdgeInsets.all(kDefaultMarginHeight * 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    title: "Home",
                    fontSize: kMediumFont14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: kDefaultMarginHeight.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextView(
                          title: "45 E 45 Stree Ny New York,United State",
                          fontSize: kMediumFont14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      TextView(
                        title: "Edit",
                        fontSize: kMediumFont14.sp,
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            TextView(
              title: "Your Order",
              fontSize: kLargeFont16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: kDefaultMarginHeight.h,
            ),
            TextView(
              title: "Order - #348834",
              fontSize: kMediumFont14.sp,
            ),
            SizedBox(
              height: 6.h,
            ),
            TextView(
              title: "Order Date - 24 April 2022",
              fontSize: kMediumFont14.sp,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 0.3.sh,
              child: CartProductListView(
                cartViewModel: cartViewModel,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            const Divider(
              height: 3,
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  title: "Total",
                  fontSize: kMediumFont14.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 6.h,
                ),
                Obx(
                  () => TextView(
                    title: cartViewModel.totalPrice.value.toString(),
                    fontSize: kMediumFont14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                buttonColor: Theme.of(context).primaryColor,
                radius: 10.h,
                buttonTextColor: Theme.of(context).colorScheme.primaryContainer,
                buttonText: 'Check Out',
                onClick: () {
                  cartViewModel.onCheckout(context: context);
                  //  Get.find<HomeScreenViewModel>().readFromHiveAndAddingIntoAllTicketModel();
                  // Get.offAndToNamed(RoutePagesName.kSuccess);
                },
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
