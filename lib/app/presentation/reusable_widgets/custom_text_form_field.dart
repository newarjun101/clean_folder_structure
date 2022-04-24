import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData? suffixIcon;
  final Color hintColor;
  final String hintText;
  final Color focusColor;
  final FocusNode focusNode;
  final bool? isNumber;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final VoidCallback? suffixIconClick;
  final bool? visible;

  const CustomTextFormField(
      {Key? key,
      this.suffixIcon,
      required this.hintColor,
      required this.hintText,
      required this.focusColor,
      required this.textController,
      this.validator,
      required this.focusNode,
      this.isNumber,
      this.suffixIconClick,
      this.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: visible ?? false,
      keyboardType:
          isNumber ?? false ? TextInputType.number : TextInputType.text,
      cursorColor: Theme.of(context).primaryColor,
      controller: textController,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: suffixIconClick,
            child: Icon(
              suffixIcon,
              color: visible ?? false
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              size: 24.sp,
            ),
          ),
          focusColor: focusColor,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: focusColor),
          ),
          hintText: hintText),
      validator: validator,
    );
  }
}
