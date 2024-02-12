// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  UserId userId;
  String post;
  DateTime postedDate;

  Posts({
    required this.userId,
    required this.post,
    required this.postedDate,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: UserId.fromJson(json["userId"]),
    post: json["post"],
    postedDate: DateTime.parse(json["postedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId.toJson(),
    "post": post,
    "postedDate": postedDate.toIso8601String(),
  };
}

class UserId {
  String name;
  String mobile;
  String address;

  UserId({
    required this.name,
    required this.mobile,
    required this.address,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    name: json["name"],
    mobile: json["mobile"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "address": address,
  };
}
