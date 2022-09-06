// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.code,
    this.data,
    this.message,
  });

  int code;
  Data data;
  String message;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.token,
    this.fleets,
  });

  String token;
  List<Fleet> fleets;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    fleets: List<Fleet>.from(json["fleets"].map((x) => Fleet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "fleets": List<dynamic>.from(fleets.map((x) => x.toJson())),
  };
}

class Fleet {
  Fleet({
    this.fleetId,
    this.fleetName,
  });

  String fleetId;
  String fleetName;

  factory Fleet.fromJson(Map<String, dynamic> json) => Fleet(
    fleetId: json["fleet_id"],
    fleetName: json["fleet_name"],
  );

  Map<String, dynamic> toJson() => {
    "fleet_id": fleetId,
    "fleet_name": fleetName,
  };
}
