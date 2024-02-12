// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

List<Signup> signupFromJson(String str) => List<Signup>.from(json.decode(str).map((x) => Signup.fromJson(x)));

String signupToJson(List<Signup> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Signup {
  String name;
  String age;
  String mobile;
  String address;
  String pincode;
  String email;
  String password;
  String? id;

  Signup({
    required this.name,
    required this.age,
    required this.mobile,
    required this.address,
    required this.pincode,
    required this.email,
    required this.password,
    this.id,
  });

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
    name: json["name"],
    age: json["age"],
    mobile: json["mobile"],
    address: json["address"],
    pincode: json["pincode"],
    email: json["email"],
    password: json["password"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "mobile": mobile,
    "address": address,
    "pincode": pincode,
    "email": email,
    "password": password,
    "_id": id,
  };
}
