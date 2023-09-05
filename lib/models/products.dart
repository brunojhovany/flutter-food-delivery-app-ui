import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  int count;
  bool error;
  dynamic msg;
  List<Product> products;

  Products({
    required this.count,
    required this.error,
    required this.msg,
    required this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        count: json["count"],
        error: json["error"],
        msg: json["msg"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "error": error,
        "msg": msg,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int productStatus;
  ProductAttrs productAttrs;

  Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.productStatus,
    required this.productAttrs,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        productStatus: json["product_status"],
        productAttrs: ProductAttrs.fromJson(json["product_attrs"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "product_status": productStatus,
        "product_attrs": productAttrs.toJson(),
      };
}

class ProductAttrs {
  String urlImage;
  String description;
  int rating;

  ProductAttrs({
    required this.urlImage,
    required this.description,
    required this.rating,
  });

  factory ProductAttrs.fromJson(Map<String, dynamic> json) => ProductAttrs(
        urlImage: json["url_image"],
        description: json["description"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "url_image": urlImage,
        "description": description,
        "rating": rating,
      };
}
