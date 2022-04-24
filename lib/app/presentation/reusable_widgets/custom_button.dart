import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import '../../core/utils/font_and_margins.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final Color buttonTextColor;
  final Color buttonColor;
  final double? fontSize;
  final double? radius;
  final FontWeight? fontWeight;
  final double? buttonHeight;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onClick,
      required this.buttonTextColor,
      required this.buttonColor,
      this.fontSize,
      this.buttonHeight,
      this.fontWeight,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: buttonHeight ?? 0.056.sh,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? kMediumFont14.sw)),
      color: buttonColor,
      onPressed: onClick,
      child: TextView(
        title: buttonText,
        fontWeight: fontWeight,
        textColor: buttonTextColor,
        fontSize: fontSize ?? kMediumFont14.sp,
      ),
    );
  }
}
