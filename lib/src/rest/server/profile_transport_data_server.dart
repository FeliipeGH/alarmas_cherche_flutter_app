// To parse this JSON data, do
//
//     final profileTransporDataC = profileTransporDataCFromJson(jsonString);

import 'dart:convert';

ProfileTransporDataC profileTransporDataCFromJson(String str) => ProfileTransporDataC.fromJson(json.decode(str));

String profileTransporDataCToJson(ProfileTransporDataC data) => json.encode(data.toJson());

class ProfileTransporDataC {
  ProfileTransporDataC({
    this.idTransportista,
    this.correoT,
    this.contraseniaT,
    this.nombreT,
    this.aPaternoT,
    this.aMaternoT,
    this.estadoT,
    this.fechaContratacionT,
    this.licenciaT,
    this.generoT,
    this.numSeguroT,
    this.fkAdminBc,
  });

  String idTransportista;
  String correoT;
  String contraseniaT;
  String nombreT;
  String aPaternoT;
  String aMaternoT;
  String estadoT;
  DateTime fechaContratacionT;
  String licenciaT;
  String generoT;
  String numSeguroT;
  String fkAdminBc;

  factory ProfileTransporDataC.fromJson(Map<String, dynamic> json) => ProfileTransporDataC(
    idTransportista: json["idTransportista"],
    correoT: json["correoT"],
    contraseniaT: json["contraseniaT"],
    nombreT: json["nombreT"],
    aPaternoT: json["aPaternoT"],
    aMaternoT: json["aMaternoT"],
    estadoT: json["estadoT"],
    fechaContratacionT: DateTime.parse(json["fechaContratacionT"]),
    licenciaT: json["licenciaT"],
    generoT: json["generoT"],
    numSeguroT: json["numSeguroT"],
    fkAdminBc: json["fkAdminBC"],
  );

  Map<String, dynamic> toJson() => {
    "idTransportista": idTransportista,
    "correoT": correoT,
    "contraseniaT": contraseniaT,
    "nombreT": nombreT,
    "aPaternoT": aPaternoT,
    "aMaternoT": aMaternoT,
    "estadoT": estadoT,
    "fechaContratacionT": "${fechaContratacionT.year.toString().padLeft(4, '0')}-${fechaContratacionT.month.toString().padLeft(2, '0')}-${fechaContratacionT.day.toString().padLeft(2, '0')}",
    "licenciaT": licenciaT,
    "generoT": generoT,
    "numSeguroT": numSeguroT,
    "fkAdminBC": fkAdminBc,
  };
}
