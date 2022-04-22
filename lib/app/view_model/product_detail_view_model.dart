import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/core/vos/product_model.dart';

class ProductDetailViewModel extends GetxController {
  RxInt sizeSelectedIndex = 0.obs;
  RxInt colorSelectedIndex = 0.obs;

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

  getProductDetail({required Content product}) {
    mProductDetail.clear();
    mProductDetail.add(product);
  }
}
