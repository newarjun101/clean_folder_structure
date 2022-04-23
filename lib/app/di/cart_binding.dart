import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/cart_view_model.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartViewModel());
  }
}
