// To parse this JSON data, do
//
//     final loginclientResponse = loginclientResponseFromJson(jsonString);

import 'dart:convert';

List<LoginclientResponse> loginclientResponseFromJson(String str) => List<LoginclientResponse>.from(json.decode(str).map((x) => LoginclientResponse.fromJson(x)));

String loginclientResponseToJson(List<LoginclientResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginclientResponse {
  LoginclientResponse({
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

  factory LoginclientResponse.fromJson(Map<String, dynamic> json) => LoginclientResponse(
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
