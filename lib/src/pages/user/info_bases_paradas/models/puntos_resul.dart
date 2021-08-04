// To parse this JSON data, do
//
//     final puntosResul = puntosResulFromJson(jsonString);

import 'dart:convert';

List<PuntosResul> puntosResulFromJson(String str) => List<PuntosResul>.from(json.decode(str).map((x) => PuntosResul.fromJson(x)));

String puntosResulToJson(List<PuntosResul> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PuntosResul {
  PuntosResul({
    this.idPunto,
    this.puntoLatitud,
    this.puntoLongitud,
    this.direccion,
    this.puntoChequeo,
    this.parada,
    this.fkTipoRecorrido,
  });

  String idPunto;
  String puntoLatitud;
  String puntoLongitud;
  String direccion;
  String puntoChequeo;
  String parada;
  String fkTipoRecorrido;

  factory PuntosResul.fromJson(Map<String, dynamic> json) => PuntosResul(
    idPunto: json["idPunto"],
    puntoLatitud: json["puntoLatitud"],
    puntoLongitud: json["puntoLongitud"],
    direccion: json["direccion"],
    puntoChequeo: json["PuntoChequeo"],
    parada: json["Parada"],
    fkTipoRecorrido: json["fkTipoRecorrido"],
  );

  Map<String, dynamic> toJson() => {
    "idPunto": idPunto,
    "puntoLatitud": puntoLatitud,
    "puntoLongitud": puntoLongitud,
    "direccion": direccion,
    "PuntoChequeo": puntoChequeo,
    "Parada": parada,
    "fkTipoRecorrido": fkTipoRecorrido,
  };
}
