import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';

import '../../../../view_model/home_screen_view_model.dart';

class BuildProductGridView extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel;

  const BuildProductGridView({Key? key, required this.homeScreenViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeScreenViewModel.mProductList.isEmpty
          ? TextView(title: "No Data Found", fontSize: kLargeFont16.sp)
          : GridView.builder(
              itemCount: homeScreenViewModel.mProductList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                childAspectRatio: 7 / 7,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (_, position) {
                return GestureDetector(
                  onTap: () => Get.toNamed(RoutePagesName.kProductDetail,
                      arguments: homeScreenViewModel.mProductList[position]),
                  child: CustomContainer(
                    bgColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    radius: 8.h,
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: 0.12.sh,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: homeScreenViewModel
                                        .mProductList[position].image,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: double.infinity,
                                      // height: 0.4.sh,
                                      decoration: BoxDecoration(
                                        //  color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(2.h),

                                        ///  shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.red,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                            child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    )),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )),
                                ],
                              )),
                          SizedBox(
                            height: kDefaultMarginHeight.h,
                          ),
                          TextView(
                              title: homeScreenViewModel
                                  .mProductList[position].name,
                              fontSize: kMediumFont14.sp),
                          SizedBox(
                            height: kDefaultMarginHeight.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: TextView(
                                title: homeScreenViewModel
                                    .mProductList[position].amount
                                    .toString(),
                                fontSize: kMediumFont14.sp,
                                fontWeight: FontWeight.bold,
                                maxLine: 2,
                              )),
                              SizedBox(
                                width: 4.w,
                              ),
                              InkWell(
                                onTap: () {
                                  int count = 1;
                                  homeScreenViewModel.addToCart(
                                      product: homeScreenViewModel
                                          .mProductList[position],
                                      count: count++);
                                },
                                child: CustomContainer(
                                  height: 30.h,
                                  width: 30.h,
                                  radius: 0.4.sh,
                                  bgColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
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
                    ),
                  ),
                );
              }),
    );
  }
}
