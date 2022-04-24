import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_innovation_shop/app/core/utils/hive_constants.dart';

part 'cart_product_model.g.dart';

String cartProductModelToJson(List<CartProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: kHiveTypeCart)
class CartProductModel {
  CartProductModel({
    required this.productId,
    required this.productName,
    required this.amount,
    required this.quantity,
    required this.image,
    required this.lineTotal,
  });

  @HiveField(0)
  final int productId;
  @HiveField(2)
  final String productName;
  @HiveField(3)
  final dynamic amount;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  final int lineTotal;
  @HiveField(6)
  final String image;

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "amount": amount,
        "quantity": quantity,
        "lineTotal": lineTotal,
      };
}
