import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/build_product_detail_screen_body/product_detail_tab_view.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import 'build_title_and_button.dart';

class BuildProductDetailBody extends StatelessWidget {
  final ProductDetailViewModel productDetailVM;

  const BuildProductDetailBody({Key? key, required this.productDetailVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: productDetailVM.mProductDetail[0].image,
              imageBuilder: (context, imageProvider) => Container(
                width: double.infinity,
                height: 0.4.sh,
                decoration: BoxDecoration(
                  color: Colors.red,

                  ///  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
                top: 30.h,
                left: kDefaultMarginWidth.w,
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Theme.of(context).primaryColor,
                    ))),
          ],
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.sp,
        ),
        BuildTitleAndButton(
          productDetailVM: productDetailVM,
        ),
        SizedBox(
          height: kDefaultMarginHeight * 2.sp,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultMarginWidth.w),
            child: ProductDetailTabView(
              productDetailViewModel: productDetailVM,
            ),
          ),
        )
      ],
    );
  }
}
