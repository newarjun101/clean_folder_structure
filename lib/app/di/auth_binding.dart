import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/auth/auth_view_model.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => AuthViewModel());
  }

}