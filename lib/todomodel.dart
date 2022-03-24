// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Signupmodel welcomeFromJson(String str) =>
    Signupmodel.fromJson(json.decode(str));

String welcomeToJson(Signupmodel data) => json.encode(data.toJson());

class Signupmodel {
  Signupmodel({
    required this.name,
    required this.surname,
    required this.userid,
    required this.gmail,
  });

  String name;
  String surname;
  String userid;
  String gmail;

  factory Signupmodel.fromJson(Map<String, dynamic> json) => Signupmodel(
        name: json["name"],
        surname: json["surname"],
        userid: json["userid"],
        gmail: json["gmail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userid": userid,
        "gmail": gmail,
      };
}
