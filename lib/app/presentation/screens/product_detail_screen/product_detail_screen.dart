import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';

import 'build_product_detail_screen_body/build_product_detail_body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productDetailVM = Get.find<ProductDetailViewModel>();
    return  Scaffold(

      body:  BuildProductDetailBody(productDetailVM: productDetailVM,),
    );
  }
}
