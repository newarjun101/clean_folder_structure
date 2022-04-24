import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/persistance/cart_db.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_container.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

class AppBarWithCartIcon extends StatelessWidget with PreferredSizeWidget {
  final String leadingIcon;
  final String title;
  final RxInt count;
  final VoidCallback logout;
  final VoidCallback onClick;
  final VoidCallback onDrawerClick;

  const AppBarWithCartIcon(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      required this.onClick,
      required this.count,
      required this.logout,
      required this.onDrawerClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: onDrawerClick,
        child: Center(
            child: SvgPicture.asset(
          "assets/images/drawer_icon.svg",
          width: 18.h,
          height: 18.h,
          color: Theme.of(context).colorScheme.onPrimary,
        )),
      ),
      title: TextView(
        title: title,
        fontSize: kLargeFont16.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        GestureDetector(
            onTap: logout,
            child: Center(
                child: TextView(
              title: "Logout",
              textColor: Colors.red,
              fontSize: kLargeFont16.sp,
              fontWeight: FontWeight.bold,
            ))),
        SizedBox(
          width: 6.w,
        ),
        GestureDetector(
          onTap: onClick,
          child: Container(
            margin: EdgeInsets.only(right: kDefaultMarginWidth.w),
            child: Center(
              child: CustomContainer(
                radius: 2.h,
                height: 35.h,
                width: 35.h,
                bgColor: Theme.of(context).primaryColor.withOpacity(0.6),
                child: Padding(
                  padding: EdgeInsets.all(4.h),
                  child: Center(
                      child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/cart_icon.svg",
                        width: 24.h,
                        height: 24.h,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 6.h,
                            backgroundColor: Colors.red,
                            child: Center(
                                child: Obx(
                              () => TextView(
                                title: count.value.toString(),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                textColor: Theme.of(context).primaryColor,
                              ),
                            )),
                          )),
                    ],
                  )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55.h);
}
