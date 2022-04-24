import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/font_and_margins.dart';
import '../../../reusable_widgets/custom_button.dart';
import '../../../reusable_widgets/text_view.dart';

class BuildCheckoutSuccessScreenBody extends StatelessWidget {
  const BuildCheckoutSuccessScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextView(
            title: "YOUR ORDER CREATED",
            fontSize: kLargeFont16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          Lottie.asset('assets/images/success.json', height: 200.h),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 0.7.sw,
            child: TextView(
              title: "Thank You For Your Order.\nRating For Your Order",
              textAlign: TextAlign.center,
              fontSize: kMediumFont14.sp,
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              glow: false,
              itemSize: 40.h,
              itemCount: 5,
              ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.orange),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                  empty: Icon(
                    Icons.star_outline_rounded,
                    color: Theme.of(context).hintColor,
                  )),
              onRatingUpdate: (value) {
                /*setState(() {
                  _ratingValue = value;
                }
                );*/
              }),
          SizedBox(
            height: 26.h,
          ),
          SizedBox(
            width: 0.5.sw,
            height: 45.h,
            child: CustomButton(
              buttonColor: Theme.of(context).primaryColor,
              radius: 4.h,
              buttonTextColor: Theme.of(context).colorScheme.primaryContainer,
              buttonText: 'Check Out',
              onClick: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
