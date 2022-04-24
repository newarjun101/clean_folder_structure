import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view_model/auth/auth_view_model.dart';
import 'build_login_screen_body/build_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authVm = Get.put(AuthViewModel());
    return Scaffold(
      body: SingleChildScrollView(
          child: BuildLoginScreenBody(authViewModel: authVm)),
    );
  }
}
