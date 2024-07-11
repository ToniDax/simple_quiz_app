import 'dart:convert';

SmsCodeModel smsCodeModelFromJson(String str) => SmsCodeModel.fromJson(json.decode(str));

String smsCodeModelToJson(SmsCodeModel data) => json.encode(data.toJson());

class SmsCodeModel {
  String? codeToken;

  SmsCodeModel({
    this.codeToken,
  });

  SmsCodeModel copyWith({
    String? codeToken,
  }) =>
      SmsCodeModel(
        codeToken: codeToken ?? this.codeToken,
      );

  factory SmsCodeModel.fromJson(Map<String, dynamic> json) => SmsCodeModel(
    codeToken: json["codeToken"],
  );

  Map<String, dynamic> toJson() => {
    "codeToken": codeToken,
  };
}
