// To parse this JSON data, do
//
//     final profileUserDataServer = profileUserDataServerFromJson(jsonString);

import 'dart:convert';

ProfileUserDataServer profileUserDataServerFromJson(String str) => ProfileUserDataServer.fromJson(json.decode(str));

String profileUserDataServerToJson(ProfileUserDataServer data) => json.encode(data.toJson());

class ProfileUserDataServer {
  ProfileUserDataServer({
    this.idUsuarioComun,
    this.correoUc,
    this.contraseniaUc,
    this.nombreUc,
    this.aPaternoUc,
    this.aMaternoUc,
    this.fechaNacUc,
    this.generoUc,
  });

  String idUsuarioComun;
  String correoUc;
  String contraseniaUc;
  String nombreUc;
  String aPaternoUc;
  String aMaternoUc;
  DateTime fechaNacUc;
  String generoUc;

  factory ProfileUserDataServer.fromJson(Map<String, dynamic> json) => ProfileUserDataServer(
    idUsuarioComun: json["idUsuarioComun"],
    correoUc: json["correoUC"],
    contraseniaUc: json["contraseniaUC"],
    nombreUc: json["nombreUC"],
    aPaternoUc: json["aPaternoUC"],
    aMaternoUc: json["aMaternoUC"],
    fechaNacUc: DateTime.parse(json["fechaNacUC"]),
    generoUc: json["generoUC"],
  );

  Map<String, dynamic> toJson() => {
    "idUsuarioComun": idUsuarioComun,
    "correoUC": correoUc,
    "contraseniaUC": contraseniaUc,
    "nombreUC": nombreUc,
    "aPaternoUC": aPaternoUc,
    "aMaternoUC": aMaternoUc,
    "fechaNacUC": "${fechaNacUc.year.toString().padLeft(4, '0')}-${fechaNacUc.month.toString().padLeft(2, '0')}-${fechaNacUc.day.toString().padLeft(2, '0')}",
    "generoUC": generoUc,
  };
}
