import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

class SimpleAppBarWithBackArrow extends StatelessWidget
    with PreferredSizeWidget {
  final String title;

  const SimpleAppBarWithBackArrow({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          size: 24.sp,
        ),
      ),
      title: TextView(
        title: title,
        fontSize: kLargeFont16.sp,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55.h);
}
