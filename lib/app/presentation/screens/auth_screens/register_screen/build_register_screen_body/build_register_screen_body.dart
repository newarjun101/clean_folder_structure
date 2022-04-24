import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/utils/font_and_margins.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_button.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/custom_text_form_field.dart';
import 'package:hive_innovation_shop/app/presentation/reusable_widgets/text_view.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/view_model/auth/auth_view_model.dart';

import '../../../../../core/exceptions/form_validation.dart';

class BuildRegisterScreenBody extends StatelessWidget {
  final AuthViewModel authViewModel;

  const BuildRegisterScreenBody({Key? key, required this.authViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    FocusNode emailNode = FocusNode();
    FocusNode passwordNode = FocusNode();
    return Container(
      height: 0.9.sh,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMarginWidth.w * 2,
          vertical: kDefaultMarginHeight.h),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                hintText: "username",
                isNumber: false,
                validator: checkIsEmpty,
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
            Obx(
              () => CustomTextFormField(
                  suffixIcon: authViewModel.isVisible.isTrue
                      ? Icons.visibility_off
                      : Icons.visibility,
                  visible: authViewModel.isVisible.value,
                  suffixIconClick: () => authViewModel.onPasswordOnOff(),
                  hintColor: Theme.of(context).primaryColor,
                  hintText: "password",
                  validator: checkIsEmpty,
                  focusColor: Theme.of(context).primaryColor,
                  isNumber: false,
                  textController: passwordTextController,
                  focusNode: passwordNode),
            ),
            SizedBox(
              height: 32.h,
            ),
            Obx(
              () => authViewModel.isError.isFalse
                  ? TextView(
                      title: authViewModel.message.value,
                      fontSize: kMediumFont14.sp,
                      textColor: Theme.of(context).textTheme.labelMedium!.color,
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                buttonText: "Create Account",
                onClick: () {
                  if (_key.currentState!.validate()) {
                    authViewModel.createAccount(
                        password: passwordTextController.text,
                        username: emailTextController.text,
                        context: context);
                  }
                },
                buttonTextColor: Theme.of(context).colorScheme.primaryContainer,
                buttonColor: Theme.of(context).primaryColor,
                radius: 8.h,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            GestureDetector(
              onTap: () => Get.offAndToNamed(RoutePagesName.kLogin),
              child: Center(
                  child: TextView(
                fontSize: kLargeFont16.sp,
                title: 'Login Account',
                textDecoration: TextDecoration.underline,
                textColor: Colors.blue,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
