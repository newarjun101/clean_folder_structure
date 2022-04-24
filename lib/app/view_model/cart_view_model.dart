import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';

import '../core/persistance/cart_db.dart';
import '../core/service/api_service.dart';
import '../core/utils/api_constants.dart';
import '../core/utils/secure_constants.dart';
import '../presentation/reusable_widgets/show_loading_dialog.dart';
import '../presentation/routes/route_pages_name.dart';
import 'home_screen_view_model.dart';

class CartViewModel extends GetxController {
  RxList<CartProductModel> mCartList = RxList([]);

  RxDouble totalPrice = 0.0.obs;
  APIService apiService = APIService();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  RxBool isVisible = true.obs;

  CartViewModel() {
    readFromHiveAndAddingIntoAllTicketModel();
  }

  ///read cart data from hive database
  readFromHiveAndAddingIntoAllTicketModel() {
    List<CartProductModel> getAllCart = CartDb().getAllCart();
    mCartList.value = getAllCart;

    for (CartProductModel cart in mCartList) {
      debugPrint(cart.amount.toString());
      totalPrice.value += double.parse(cart.amount.toString());
    }
  }

  ///post checkout  data to server
  Future<void> onCheckout({context}) async {
    Map<String, dynamic> mOrderData = {
      "orderEntries": jsonDecode(cartProductModelToJson(mCartList)),
      "subTotal": totalPrice.value,
      "tax": 100,
      "total": mCartList.length
    };
    showLoaderDialog(context);
    try {
      dynamic orderResponse = await apiService.postAPICall(
          url: kOrder, param: mOrderData, isHeader: true);

      Map orderData = jsonDecode(orderResponse);
      if (orderData["orderNumber"] != null) {
        isError.value = false;
        message.value = "success";
        debugPrint("success");
        Get.back();
        CartDb().deleteCart();
        Get.find<HomeScreenViewModel>()
            .readFromHiveAndAddingIntoAllTicketModel();
        Get.offAndToNamed(RoutePagesName.kSuccess);
        Get.snackbar("Success", "Order Successful",

            //    icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.withOpacity(0.6));
      } else {
        debugPrint(orderData["orderNumber"]);
        isError.value = false;
        debugPrint("error");
        message.value = orderData["orderNumber"];
        Get.back();
        Get.snackbar("Error during Checkout", message.value,

            //    icon: Icon(Icons.person, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.withOpacity(0.6));
      }

      // Get.offAndToNamed(RoutePagesName.kINITIAL);
    } catch (e) {
      message.value = e.toString();
      isError.value = true;
      isLoading.value = false;
      debugPrint("error on catch $message");
      Get.back();
      Get.snackbar("Error during Checkout", message.value,

          //    icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey.withOpacity(0.6));
    }
  }
}
