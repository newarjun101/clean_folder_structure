import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';
import 'package:hive_innovation_shop/app/core/vos/cart_product_model.dart';
import 'package:hive_innovation_shop/app/core/vos/product_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../core/persistance/cart_db.dart';
import '../core/service/api_service.dart';

class HomeScreenViewModel extends GetxController {
  late RxString token;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isFavorite = false.obs;
  RxString message = "".obs;
  RxBool isLastPage = false.obs;
  RxInt totalPage = 0.obs;
  late APIService _apiService;
  RxInt page = 0.obs;
  RxBool isRefresh = false.obs;
  late RxList<Content> mProductList = RxList([]);
  RxList<CartProductModel> mCartList = RxList([]);
  RxInt mTotalCart = 0.obs;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  HomeScreenViewModel() {
    //token.value =GetStorage().read(kToken);
    _apiService = Get.put(APIService());
    readFromHiveAndAddingIntoAllTicketModel();
    print(mCartList.length);

  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    readFromHiveAndAddingIntoAllTicketModel();
  }


  @override
  void onInit() {
    ever(mTotalCart, (value) {

      readFromHiveAndAddingIntoAllTicketModel();
      mCartList.refresh();
      print("value is $mTotalCart");
    });
    super.onInit();
  }

  Future<void> getProduct({page}) async {
    if (isRefresh.isFalse) {
      isLoading.value = true;
    }
    try {
      dynamic responseData = await _apiService.getAPICall(
          url: "products?page=$page&size=${6}", isHeader: true);

      ProductModel productModel = productModelFromJson(responseData);

      mProductList.addAll(productModel.content);
      debugPrint(mProductList.length.toString());
      if (productModel.totalPages >= 0) {
        isError.value = false;
        isLoading.value = false;
        message.value = "success";
      } else {
        isError.value = false;
        isLoading.value = false;
        message.value = "Something Went Wrong";
      }
      totalPage.value = productModel.totalPages;
      isLastPage.value = productModel.last;
      //  debugPrint(responseData);
    } catch (e) {
      isError.value = true;
      isLoading.value = false;
      message.value = e.toString();
      debugPrint(e.toString());
    }
  }

  void onLoad() async {
    page.value++;
    debugPrint("auto load");
    isRefresh.value = true;
    if (totalPage.value >= page.value) {
      getProduct(page: page.value);
      debugPrint("auto load");
    }
    // await getProduct(page: page.value);
    // if failed,use refreshFailed()
    refreshController.loadComplete();
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
    readFromHiveAndAddingIntoAllTicketModel();
  }

  ///read cart data from hive database
  readFromHiveAndAddingIntoAllTicketModel() {
    List<CartProductModel> getAllCart = CartDb().getAllCart();
    mCartList.value = getAllCart;
    mCartList.refresh();
    mTotalCart.value = mCartList.length;
  }
}
