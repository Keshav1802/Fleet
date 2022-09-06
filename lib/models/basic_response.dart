// To parse this JSON data, do
//
//     final basicResponse = basicResponseFromJson(jsonString);

import 'dart:convert';

BasicResponse basicResponseFromJson(String str) => BasicResponse.fromJson(json.decode(str));

String basicResponseToJson(BasicResponse data) => json.encode(data.toJson());

class BasicResponse {
  BasicResponse({
    this.code,
    this.data,
    this.message,
  });

  int code;
  dynamic data;
  String message;

  factory BasicResponse.fromJson(Map<String, dynamic> json) => BasicResponse(
    code: json["code"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data,
    "message": message,
  };
}
