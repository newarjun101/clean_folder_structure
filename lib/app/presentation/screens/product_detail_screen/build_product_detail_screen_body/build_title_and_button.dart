import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

import '../../../../view_model/product_detail_view_model.dart';

class BuildTitleAndButton extends StatelessWidget {
  final ProductDetailViewModel productDetailVM;

  const BuildTitleAndButton({Key? key, required this.productDetailVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            title: productDetailVM.mProductDetail[0].name,
            fontSize: kLargeFont16.sp,
            fontWeight: FontWeight.bold,
            maxLine: 2,
          ),
          SizedBox(
            width: 16.w,
          ),
          CustomContainer(
            bgColor: Theme.of(context).colorScheme.primary,
            radius: 2.h,
            width: 80.h,
            height: 45.h,
            child: Padding(
              padding: EdgeInsets.all(6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => productDetailVM.decrement(),
                    child: Icon(
                      Icons.remove,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  Obx(
                    () => TextView(
                      title: productDetailVM.counter.toString(),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      maxLine: 1,
                      textColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => productDetailVM.increment(),
                    child: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
