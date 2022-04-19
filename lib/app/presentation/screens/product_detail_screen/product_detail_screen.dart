import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'build_product_detail_screen_body/build_product_detail_body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body:  BuildProductDetailBody(),
    );
  }
}
