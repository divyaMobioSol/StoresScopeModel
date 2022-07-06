// To parse this JSON data, do
//
//     final store = storeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Store> storeFromMap(var str) =>
    List<Store>.from(str.map((x) => Store.fromMap(x)));

String storeToMap(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Store {
  Store({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
    this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  Category? category;
  final String image;
  Rating? rating;

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
        // ignore: prefer_null_aware_operators
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"],
        category: json["category"] == null
            ? null
            : categoryValues.map[json["category"]],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category == null ? null : categoryValues.reverse[category],
        "image": image,
        "rating": rating == null ? null : rating!.toMap(),
      };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
