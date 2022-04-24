import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/home_screen_view_model.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeScreenViewModel());
  }
}
