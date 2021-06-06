// To parse this JSON data, do
//
//     final profileUserActualizarClient = profileUserActualizarClientFromJson(jsonString);

import 'dart:convert';

ProfileUserActualizarClient profileUserActualizarClientFromJson(String str) => ProfileUserActualizarClient.fromJson(json.decode(str));

String profileUserActualizarClientToJson(ProfileUserActualizarClient data) => json.encode(data.toJson());

class ProfileUserActualizarClient {
  ProfileUserActualizarClient({
    this.opcion,
    this.idUsuarioComun,
    this.correoUc,
    this.contraseniaUc,
    this.nombreUc,
    this.aPaternoUc,
    this.aMaternoUc,
    this.fechaNacUc,
    this.generoUc,
  });

  String opcion;
  String idUsuarioComun;
  String correoUc;
  String contraseniaUc;
  String nombreUc;
  String aPaternoUc;
  String aMaternoUc;
  String fechaNacUc;
  String generoUc;

  factory ProfileUserActualizarClient.fromJson(Map<String, dynamic> json) => ProfileUserActualizarClient(
    opcion: json["opcion"],
    idUsuarioComun: json["idUsuarioComun"],
    correoUc: json["correoUC"],
    contraseniaUc: json["contraseniaUC"],
    nombreUc: json["nombreUC"],
    aPaternoUc: json["aPaternoUC"],
    aMaternoUc: json["aMaternoUC"],
    fechaNacUc: json["fechaNacUC"],
    generoUc: json["generoUC"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "idUsuarioComun": idUsuarioComun,
    "correoUC": correoUc,
    "contraseniaUC": contraseniaUc,
    "nombreUC": nombreUc,
    "aPaternoUC": aPaternoUc,
    "aMaternoUC": aMaternoUc,
    "fechaNacUC": fechaNacUc,
    "generoUC": generoUc,
  };

  @override
  String toString() {
    return 'ProfileUserActualizarClient{opcion: $opcion, idUsuarioComun: $idUsuarioComun, correoUc: $correoUc, contraseniaUc: $contraseniaUc, nombreUc: $nombreUc, aPaternoUc: $aPaternoUc, aMaternoUc: $aMaternoUc, fechaNacUc: $fechaNacUc, generoUc: $generoUc}';
  }
}
