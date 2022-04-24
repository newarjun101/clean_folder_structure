import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_innovation_shop/app/core/theme/theme.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'app/core/helper/hive_helper.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // runApp(const MyApp());
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveHelper().openBoxed();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
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
        initialRoute: GetStorage().read(kToken) != null
            ? RoutePagesName.kINITIAL
            : RoutePagesName.kLogin,
        //love for this
        getPages: RoutePages().routerPage,
      );
    });
  }
}
