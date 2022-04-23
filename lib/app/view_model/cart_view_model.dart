import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';

import '../core/persistance/cart_db.dart';

class CartViewModel extends GetxController {
  RxList<CartProductModel> mCartList = RxList([]);

  RxDouble totalPrice = 0.0.obs;

  CartViewModel() {
    readFromHiveAndAddingIntoAllTicketModel();
  }

  ///read cart data from hive database
  readFromHiveAndAddingIntoAllTicketModel() {
    List<CartProductModel> getAllCart = CartDb().getAllCart();
    mCartList.value = getAllCart;

    for(CartProductModel cart in mCartList) {

      print(double.parse(cart.amount.toString()));
      totalPrice.value += double.parse(cart.amount.toString());

    }
  }
}
