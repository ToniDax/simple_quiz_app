// To parse this JSON data, do
//
//     final authTokenModel = authTokenModelFromJson(jsonString);

import 'dart:convert';

AuthTokenModel authTokenModelFromJson(String str) => AuthTokenModel.fromJson(json.decode(str));

String authTokenModelToJson(AuthTokenModel data) => json.encode(data.toJson());

class AuthTokenModel {
  String? token;
  String? refreshToken;

  AuthTokenModel({
    this.token,
    this.refreshToken,
  });

  AuthTokenModel copyWith({
    String? token,
    String? refreshToken,
  }) =>
      AuthTokenModel(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => AuthTokenModel(
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
  };
}
