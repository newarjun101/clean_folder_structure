import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';

import '../../../reusable_widgets/text_view.dart';

class CartProductListView extends StatelessWidget {
  const CartProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, position) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultMarginWidth.w,
                vertical: kDefaultMarginHeight.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2016/09/02/11/10/boots-1638873_960_720.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80.h,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.h),

                      ///  shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        title: "Product Code : 122477",
                        fontSize: kSmallFont12.sp,
                        textColor: Theme.of(context).hintColor,
                      ),
                      SizedBox(
                        width: 6.h,
                      ),
                      TextView(
                        title: "1 X Adidas Originals Trefoil overhead ",
                        fontSize: kLargeFont16.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Center(
                  child: TextView(
                    title: "2000",
                    fontSize: kLargeFont16.sp,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
