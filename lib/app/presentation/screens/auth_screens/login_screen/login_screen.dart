import 'package:flutter/material.dart';

import 'build_login_screen_body/build_login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  BuildLoginScreenBody(),
    );
  }
}
