import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import '../../../reusable_widgets/custom_container.dart';


class ListViewForColor extends StatelessWidget {
  final ProductDetailViewModel productDetailViewModel;

  const ListViewForColor({Key? key, required this.productDetailViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => productDetailViewModel.changeColor(index),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Center(
              child: Obx(
                () => CustomContainer(
                  height: 50.h,
                  width: 50.h,
                  isShadow: true,
                  radius: 0.4.sh,
                  bgColor: productDetailViewModel.mColor[index],
                  child: Center(
                      child: Icon(
                    Icons.check,
                    color:
                        productDetailViewModel.colorSelectedIndex.value == index
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
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
