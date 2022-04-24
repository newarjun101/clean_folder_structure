import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.content,
  });

  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool last;
  final List<Content> content;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        page: json["page"],
        size: json["size"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        last: json["last"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "last": last,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    required this.id,
    required this.image,
    required this.createdDate,
    required this.name,
    required this.amount,
    required this.description,
    required this.category,
  });

  final int id;
  final String image;
  final String createdDate;
  final String name;
  final dynamic amount;
  final String description;
  final Category category;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"] ?? "",
        image: json["image"] ?? "",
        createdDate: json["createdDate"] ?? "",
        name: json["name"] ?? "",
        amount: json["amount"] ?? "",
        description: json["description"] ?? "",
        category: json["category"] == null
            ? Category.fromJson(json["category"])
            : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "createdDate": createdDate,
        "name": name,
        "amount": amount,
        "description": description,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.createdDate,
    required this.name,
  });

  final int id;
  final String createdDate;
  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? "",
        createdDate: json["createdDate"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdDate": createdDate,
        "name": name,
      };
}
