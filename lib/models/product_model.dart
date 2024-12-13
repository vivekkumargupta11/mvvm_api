
import 'dart:convert';

List<ProductModel> productModelFromMap(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromMap(x)));

String productModelToMap(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
  );

  get thumbnailUrl => null;

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toMap(),
  };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toMap() => {
    "rate": rate,
    "count": count,
  };
}