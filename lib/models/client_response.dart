// To parse this JSON data, do
//
//     final clientResponse = clientResponseFromJson(jsonString);

import 'dart:convert';

ClientResponse clientResponseFromJson(String str) => ClientResponse.fromJson(json.decode(str));

String clientResponseToJson(ClientResponse data) => json.encode(data.toJson());

class ClientResponse {
  ClientResponse({
    this.url,
    this.mobile,
    this.name,
    this.password,
    this.id,
    this.created,
    this.lastUpdated,
    this.isActive,
  });

  String url;
  String mobile;
  String name;
  String password;
  int id;
  DateTime created;
  DateTime lastUpdated;
  bool isActive;

  factory ClientResponse.fromJson(Map<String, dynamic> json) => ClientResponse(
    url: json["url"],
    mobile: json["mobile"],
    name: json["name"],
    password: json["password"],
    id: json["id"],
    created: DateTime.parse(json["created"]),
    lastUpdated: DateTime.parse(json["last_updated"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "mobile": mobile,
    "name": name,
    "password": password,
    "id": id,
    "created": created.toIso8601String(),
    "last_updated": lastUpdated.toIso8601String(),
    "is_active": isActive,
  };
}
