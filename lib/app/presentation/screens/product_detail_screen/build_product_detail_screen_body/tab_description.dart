import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import 'list_view_for_color.dart';
import 'list_view_for_size.dart';

String text =
    "Lorem Ipsum is simply dummy text the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.";

class TabDescription extends StatelessWidget {
  final ProductDetailViewModel productDetailViewModel;

  const TabDescription({Key? key, required this.productDetailViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextView(
          title: productDetailViewModel.mProductDetail[0].description,
          fontSize: kMediumFont14.sp,
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.h,
        ),
        TextView(
          title: "Select Size",
          fontSize: kMediumFont14.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: kDefaultMarginHeight.h,
        ),
        SizedBox(
            height: 60.h,
            child: ListViewForSize(
              productDetailViewModel: productDetailViewModel,
            )),
        SizedBox(
          height: kDefaultMarginHeight * 2.h,
        ),
        TextView(
          title: "Select Color",
          fontSize: kMediumFont14.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
            height: 60.h,
            child: ListViewForColor(
              productDetailViewModel: productDetailViewModel,
            )),
      ],
    );
  }
}
