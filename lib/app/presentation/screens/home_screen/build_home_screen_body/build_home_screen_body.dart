import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/view_model/home_screen_view_model.dart';
import 'build_product_grid_view.dart';

class BuildHomeScreenBody extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel;

  const BuildHomeScreenBody({Key? key, required this.homeScreenViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 0.7.sw,
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                  TextSpan(
                      text: "Hello...",
                      style: TextStyle(
                        fontSize: kMediumFont14.sp,
                      )),
                  TextSpan(
                      text: "What fruit salad combo do you want today?",
                      style: TextStyle(
                          fontSize: kMediumFont14.sp,
                          fontWeight: FontWeight.bold)),
                ])),
          ),
          SizedBox(
            height: kDefaultMarginHeight.h,
          ),
          TextView(
            title: "Search here",
            fontSize: kMediumFont14.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: kDefaultMarginHeight.h,
          ),
          TextView(
            title: "Recommended Combo",
            fontSize: kLargeFont16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: kDefaultMarginHeight.h,
          ),
          Expanded(
              child: BuildProductGridView(
            homeScreenViewModel: homeScreenViewModel,
          )),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
