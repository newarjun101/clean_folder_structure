import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

class BuildProductGridView extends StatelessWidget {
  const BuildProductGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          childAspectRatio: 7 / 7,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (_, position) {
          return CustomContainer(
            bgColor: Theme.of(context).primaryColor.withOpacity(0.2),
            radius: 8.h,
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(4.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 0.12.sh,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/shoes.png",
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                  onTap: () => print("hello World"),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Theme.of(context).primaryColor,
                                  ))),
                        ],
                      )),
                  SizedBox(
                    height: kDefaultMarginHeight.h,
                  ),
                  TextView(title: "Shoes", fontSize: kMediumFont14.sp),
                  SizedBox(
                    height: kDefaultMarginHeight.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextView(
                        title: "10000000 Kyats",
                        fontSize: kMediumFont14.sp,
                        fontWeight: FontWeight.bold,
                        maxLine: 2,
                      )),
                      SizedBox(
                        width: 4.w,
                      ),
                      InkWell(
                        onTap: () => print("hello World"),
                        child: CustomContainer(
                          height: 30.h,
                          width: 30.h,
                          radius: 0.4.sh,
                          bgColor:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                          child: Center(
                              child: TextView(
                            title: "+",
                            fontSize: kLargestFont22.sp,
                            textColor: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.6),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
          );
        });
  }
}
