// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  int id;
  String title;
  String content;
  String? imageUrl;
  int categoryId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["imageUrl"] ?? "",
        categoryId: json["categoryId"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "imageUrl": imageUrl,
        "categoryId": categoryId,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "User": user.toJson(),
      };
  // static method for creating new post
  static newPost({
    required String title,
    required String content,
    required int categoryId,
    required int userId,
  }) =>
      {
        "title": title,
        "content": content,
        "categoryId": categoryId,
        "userId": userId
      };
}

class User {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
