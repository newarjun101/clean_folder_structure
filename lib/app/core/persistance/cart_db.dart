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
      // ..deleteAll(getCartBox().keys)
      ..add(cartVo);
  }

  Future updateCart(CartProductModel cartVo, index) async {
    return getCartBox()
      //  ..deleteAll(getCartBox().keys)
      ..putAt(index, cartVo);
  }

  List<CartProductModel> getAllCart() {
    return getCartBox().values.toList().isEmpty
        ? []
        : getCartBox().values.toList();
  }

  Future deleteCart() {
    return getCartBox().deleteAll(getCartBox().keys);
  }

  Box<CartProductModel> getCartBox() {
    return Hive.box<CartProductModel>(kHiveCartBox);
  }
}
