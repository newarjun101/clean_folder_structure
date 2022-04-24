import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/splash_screen_view_model.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => SplashScreenViewModel());
  }
}
