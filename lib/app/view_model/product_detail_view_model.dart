import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/vos/product_model.dart';
import 'package:hive_innovation_shop/app/view_model/home_screen_view_model.dart';

import '../core/persistance/cart_db.dart';
import '../core/vos/cart_product_model.dart';

class ProductDetailViewModel extends GetxController {
  RxInt sizeSelectedIndex = 0.obs;
  RxInt mTotalCart = 0.obs;
  RxInt colorSelectedIndex = 0.obs;

  RxInt counter = 1.obs;
  RxList<CartProductModel> mCartList = RxList([]);

  List<String> mSizeList = ["S", "M", "K"];
  List<Color> mColor = [Colors.red, Colors.blueAccent, Colors.pink];

  late RxList<Content> mProductDetail = RxList();

  ProductDetailViewModel();

  void changeSelectedSized(int index) {
    sizeSelectedIndex.value = index;
  }

  void changeColor(int index) {
    colorSelectedIndex.value = index;
  }

  increment() {
    counter.value++;
  }

  decrement() {
    if (counter.value > 0) {
      counter.value--;
    }
  }

  getProductDetail({required Content product}) {
    mProductDetail.clear();
    mProductDetail.add(product);
  }

  addToCart({required Content product, required int count}) {
    // CartDb().deleteCart();
    CartProductModel cartProductModel = CartProductModel(
        productId: product.id,
        productName: product.name,
        amount: product.amount,
        image: product.image,
        quantity: 1,
        lineTotal: 10);
    CartDb().saveCart(cartProductModel);
    Get.find<HomeScreenViewModel>().readFromHiveAndAddingIntoAllTicketModel();
    Get.snackbar("New Data Added", "Thank you for choosing this product",
        //    icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey.withOpacity(0.6));
  }

  ///read cart data from hive database
  readFromHiveAndAddingIntoAllTicketModel() {
    List<CartProductModel> getAllCart = CartDb().getAllCart();
    mCartList.value = getAllCart;
    mTotalCart.value = mCartList.length;
  }

  ///post checkout data to server

}
