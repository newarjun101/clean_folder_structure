import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';

import '../../../../view_model/cart_view_model.dart';
import '../../../reusable_widgets/text_view.dart';

class CartProductListView extends StatelessWidget {
  final CartViewModel cartViewModel;

  const CartProductListView({Key? key, required this.cartViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartViewModel.mCartList.length,
        itemBuilder: (_, position) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultMarginWidth.w,
                vertical: kDefaultMarginHeight.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CachedNetworkImage(
                  imageUrl: cartViewModel.mCartList[position].image,
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        title:
                            "Product Code : ${cartViewModel.mCartList[position].productId}",
                        fontSize: kSmallFont12.sp,
                        textColor: Theme.of(context).hintColor,
                      ),
                      SizedBox(
                        width: 6.h,
                      ),
                      TextView(
                        title: cartViewModel.mCartList[position].productName,
                        fontSize: kLargeFont16.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                TextView(
                  title: cartViewModel.mCartList[position].amount.toString(),
                  fontSize: kLargeFont16.sp,
                ),
              ],
            ),
          );
        });
  }
}
