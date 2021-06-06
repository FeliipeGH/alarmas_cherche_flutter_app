// To parse this JSON data, do
//
//     final registerUserClient = registerUserClientFromJson(jsonString);

import 'dart:convert';

RegisterUserClient registerUserClientFromJson(String str) => RegisterUserClient.fromJson(json.decode(str));

String registerUserClientToJson(RegisterUserClient data) => json.encode(data.toJson());

class RegisterUserClient {
  RegisterUserClient({
    this.opcion,
    this.correoR,
    this.contraseniaR,
    this.nomPersonaR,
    this.aPaternoR,
    this.aMaternoR,
    this.fechaNr,
    this.generoR,
  });

  String opcion;
  String correoR;
  String contraseniaR;
  String nomPersonaR;
  String aPaternoR;
  String aMaternoR;
  String fechaNr;
  String generoR;

  factory RegisterUserClient.fromJson(Map<String, dynamic> json) => RegisterUserClient(
    opcion: json["opcion"],
    correoR: json["correoR"],
    contraseniaR: json["contraseniaR"],
    nomPersonaR: json["nomPersonaR"],
    aPaternoR: json["aPaternoR"],
    aMaternoR: json["aMaternoR"],
    fechaNr: json["fechaNR"],
    generoR: json["generoR"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "correoR": correoR,
    "contraseniaR": contraseniaR,
    "nomPersonaR": nomPersonaR,
    "aPaternoR": aPaternoR,
    "aMaternoR": aMaternoR,
    "fechaNR": fechaNr,
    "generoR": generoR,
  };
}
