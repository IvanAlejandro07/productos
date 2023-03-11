// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

class Product {
    Product({
        required this.available,
        required this.name,
        this.picture,
        required this.price,
    });

    bool available;
    String name;
    String? picture;
    double price;
    String? id;

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };
}
