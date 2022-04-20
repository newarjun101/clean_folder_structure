import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/theme/theme.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/presentation/screens/auth_screens/login_screen/login_screen.dart';

void main() {
  // runApp(const MyApp());
  runApp(DevicePreview(
      enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: StyleTheme().getLightTheme(),
        initialRoute: RoutePagesName.kSuccess, //love for this
        getPages: RoutePages().routerPage,
      );
    });
  }
}
