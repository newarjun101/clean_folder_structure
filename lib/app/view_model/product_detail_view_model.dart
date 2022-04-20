import 'package:get/get.dart';

class ProductDetailViewModel extends GetxController {
  RxInt sizeSelectedIndex = 0.obs;

  List<String> mSizeList = ["S", "M", "K"];

  ProductDetailViewModel();

  void changeSelectedSized(int index) {
    sizeSelectedIndex.value = index;
  }
}
