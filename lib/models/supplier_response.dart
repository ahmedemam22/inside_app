// To parse this JSON data, do
//
//     final supplierResponse = supplierResponseFromJson(jsonString);

import 'dart:convert';

SupplierResponse supplierResponseFromJson(String str) => SupplierResponse.fromJson(json.decode(str));

String supplierResponseToJson(SupplierResponse data) => json.encode(data.toJson());

class SupplierResponse {
  SupplierResponse({
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

  factory SupplierResponse.fromJson(Map<String, dynamic> json) => SupplierResponse(
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
  };
}
