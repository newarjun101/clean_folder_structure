import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/font_and_margins.dart';
import '../../../reusable_widgets/custom_container.dart';
import '../../../reusable_widgets/text_view.dart';

class ListViewForColor extends StatelessWidget {
  const ListViewForColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => print("hello World"),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.h),
            child: Center(
              child: CustomContainer(
                height: 50.h,
                width: 50.h,
                radius: 0.4.sh,
                bgColor: Theme.of(context).primaryColor.withOpacity(0.8),
                child: Center(
                    child: TextView(
                  title: "+",
                  fontSize: kLargestFont22.sp,
                  textColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
