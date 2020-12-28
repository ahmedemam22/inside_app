// To parse this JSON data, do
//
//     final loginSupplierResponse = loginSupplierResponseFromJson(jsonString);

import 'dart:convert';

List<LoginSupplierResponse> loginSupplierResponseFromJson(String str) => List<LoginSupplierResponse>.from(json.decode(str).map((x) => LoginSupplierResponse.fromJson(x)));

String loginSupplierResponseToJson(List<LoginSupplierResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginSupplierResponse {
  LoginSupplierResponse({
    this.type,
    this.created,
    this.id,
    this.name,
    this.bio,
    this.established,
    this.logo,
    this.lastUpdated,
    this.isActive,
    this.dateToPay,
    this.mobile,
    this.password,
    this.image,
  });

  dynamic type;
  DateTime created;
  int id;
  String name;
  dynamic bio;
  dynamic established;
  dynamic logo;
  DateTime lastUpdated;
  bool isActive;
  dynamic dateToPay;
  String mobile;
  String password;
  dynamic image;

  factory LoginSupplierResponse.fromJson(Map<String, dynamic> json) => LoginSupplierResponse(
    type: json["type"],
    created: DateTime.parse(json["created"]),
    id: json["id"],
    name: json["name"],
    bio: json["bio"],
    established: json["established"],
    logo: json["logo"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    isActive: json["is_active"],
    dateToPay: json["date_to_pay"],
    mobile: json["mobile"],
    password: json["password"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "created": created.toIso8601String(),
    "id": id,
    "name": name,
    "bio": bio,
    "established": established,
    "logo": logo,
    "last_updated": lastUpdated.toIso8601String(),
    "is_active": isActive,
    "date_to_pay": dateToPay,
    "mobile": mobile,
    "password": password,
    "image": image,
  };
}
