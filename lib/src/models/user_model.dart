import 'dart:convert';

UserModel  userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());


class UserModel{
  String? email;
  String? password;
  String? smsToken;


  UserModel({
    this.email,
    this.password,
    this.smsToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    password: json["password"],
    smsToken: json["smsToken"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "smsToken": smsToken,
  };
}