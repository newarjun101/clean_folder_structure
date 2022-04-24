import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import '../../../../core/utils/font_and_margins.dart';
import '../../../reusable_widgets/custom_container.dart';
import '../../../reusable_widgets/text_view.dart';

class ListViewForSize extends StatelessWidget {
  final ProductDetailViewModel productDetailViewModel;

  const ListViewForSize({Key? key, required this.productDetailViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => productDetailViewModel.changeSelectedSized(index),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Center(
              child: Obx(
                () => CustomContainer(
                  height: 50.h,
                  width: 50.h,
                  isShadow: true,
                  radius: 0.4.sh,
                  bgColor:
                      productDetailViewModel.sizeSelectedIndex.value == index
                          ? Theme.of(context).primaryColor.withOpacity(0.8)
                          : Theme.of(context).hintColor,
                  child: Center(
                      child: TextView(
                    title: productDetailViewModel.mSizeList[index],
                    fontSize: kLargeFont16.sp,
                    textColor: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.6),
                  )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
