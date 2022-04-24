import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

class TabCustomerReview extends StatelessWidget {
  const TabCustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextView(
      title: "Review Coming Soon",
      fontSize: kMediumFont14.sp,
    ));
  }
}
