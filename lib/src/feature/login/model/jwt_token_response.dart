// To parse this JSON data, do
//
//     final jwtTokenResponse = jwtTokenResponseFromJson(jsonString);

import 'dart:convert';

JwtTokenResponse jwtTokenResponseFromJson(String str) =>
    JwtTokenResponse.fromJson(json.decode(str));

String jwtTokenResponseToJson(JwtTokenResponse data) =>
    json.encode(data.toJson());

class JwtTokenResponse {
  String access;
  String refresh;

  JwtTokenResponse({required this.access, required this.refresh});

  factory JwtTokenResponse.fromJson(Map<String, dynamic> json) =>
      JwtTokenResponse(access: json["access"], refresh: json["refresh"]);

  Map<String, dynamic> toJson() => {"access": access, "refresh": refresh};
}
