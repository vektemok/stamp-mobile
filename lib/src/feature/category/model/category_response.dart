// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
  int id;
  String name;
  String slug;
  String description;
  String icon;
  DateTime createdAt;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.icon,
    required this.createdAt,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "icon": icon,
    "created_at": createdAt.toIso8601String(),
  };
}
