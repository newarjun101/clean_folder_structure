import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view_model/auth/auth_view_model.dart';
import 'build_register_screen_body/build_register_screen_body.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authVm = Get.put(AuthViewModel());
    return Scaffold(
      body: SingleChildScrollView(
          child: BuildRegisterScreenBody(authViewModel: authVm)),
    );
  }
}
