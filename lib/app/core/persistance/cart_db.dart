import 'package:hive/hive.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';

import '../utils/hive_constants.dart';

class CartDb {
  static final CartDb _singleton = CartDb._internal();

  factory CartDb() {
    return _singleton;
  }

  CartDb._internal();

  Future saveCart(CartProductModel cartVo) async {
    return getCartBox()
      //  ..deleteAll(getCartBox().keys)
      ..add(cartVo);
  }

  List<CartProductModel> getAllCart() {
    return getCartBox().values.toList().isEmpty
        ? []
        : getCartBox().values.toList();
  }

  Future deleteCart() {
    return getCartBox().deleteAll(getCartBox().keys);
  }

  Future update(CartProductModel cartVo,int quality) async {
    List<CartProductModel> mCart = getAllCart();

    for (CartProductModel cart in mCart) {
      if (cart.productId == cartVo.productId) {
        cart.quantity = quality;
        saveCart(cart);
      }

    }
    return getCartBox()
      //  ..deleteAll(getCartBox().keys)
      ..add(cartVo);
  }

  Box<CartProductModel> getCartBox() {
    return Hive.box<CartProductModel>(kHiveCartBox);
  }
}
