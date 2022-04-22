import 'package:hive/hive.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';

import '../utils/hive_constants.dart';

class HiveHelper {
  HiveHelper() {
    _registerBox();
  }

  _registerBox() {
    Hive.registerAdapter(CartProductModelAdapter());
  }

  Future openBoxed() async {
    await Future.wait([
      Hive.openBox<CartProductModel>(kHiveCartBox),
    ]);
  }
}
