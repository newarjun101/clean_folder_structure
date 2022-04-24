import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductDetailViewModel());
  }
}
