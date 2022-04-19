import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_button.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_text_form_field.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';

class BuildLoginScreenBody extends StatelessWidget {
  const BuildLoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    FocusNode emailNode = FocusNode();
    FocusNode passwordNode = FocusNode();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMarginWidth.w * 2,
          vertical: kDefaultMarginHeight.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: TextView(
            title: "Welcome!!!",
            fontSize: kLargestFont22.sp,
            fontWeight: FontWeight.bold,
            textColor: Theme.of(context).primaryColor,
          )),
          SizedBox(height: 32.h),
          TextView(
            title: "Email",
            fontSize: kMediumFont14.sp,
            textColor: Theme.of(context).textTheme.labelMedium!.color,
          ),
          CustomTextFormField(
              hintColor: Theme.of(context).primaryColor,
              hintText: "hintText",
              isNumber: false,
              focusColor: Theme.of(context).primaryColor,
              textController: emailTextController,
              focusNode: emailNode),
          SizedBox(
            height: kDefaultMarginHeight.h * 2,
          ),
          TextView(
            title: "Password",
            fontSize: kMediumFont14.sp,
            textColor: Theme.of(context).textTheme.labelMedium!.color,
          ),
          CustomTextFormField(
              suffixIcon: Icons.visibility,
              visible: true,
              suffixIconClick: ()=>print("hi"),
              hintColor: Theme.of(context).primaryColor,
              hintText: "hintText",
              focusColor: Theme.of(context).primaryColor,
              isNumber: false,
              textController: passwordTextController,
              focusNode: passwordNode),

          SizedBox(
            height: 32.h ,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(buttonText: "Login", onClick: ()=>print("hahahah"), buttonTextColor: Theme.of(context).colorScheme.primaryContainer
                , buttonColor: Theme.of(context).primaryColor,radius: 8.h,),
          )
        ],
      ),
    );
  }
}
