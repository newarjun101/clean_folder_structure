import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_innovation_shop/app/core/utils/hive_constants.dart';
part 'cart_product_model.g.dart';

List<CartProductModel> cartProductModelFromJson(String str) =>
    List<CartProductModel>.from(
        json.decode(str).map((x) => CartProductModel.fromJson(x)));

String cartProductModelToJson(List<CartProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: kHiveTypeCart)
class CartProductModel {
  CartProductModel({
    required this.productId,
    required this.productName,
    required this.amount,
    required this.quantity,
    required this.lineTotal,
  });

  @HiveField(0)
  final int productId;
  @HiveField(2)
  final String productName;
  @HiveField(3)
  final int amount;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final int lineTotal;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        productId: json["productId"],
        productName: json["productName"],
        amount: json["amount"],
        quantity: json["quantity"],
        lineTotal: json["lineTotal"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "amount": amount,
        "quantity": quantity,
        "lineTotal": lineTotal,
      };
}
