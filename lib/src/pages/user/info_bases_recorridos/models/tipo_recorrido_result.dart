// To parse this JSON data, do
//
//     final tipRecorridoResul = tipRecorridoResulFromJson(jsonString);

import 'dart:convert';

List<TipRecorridoResul> tipRecorridoResulFromJson(String str) => List<TipRecorridoResul>.from(json.decode(str).map((x) => TipRecorridoResul.fromJson(x)));

String tipRecorridoResulToJson(List<TipRecorridoResul> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipRecorridoResul {
  TipRecorridoResul({
    this.idTipoRecorrido,
    this.nombreTr,
    this.estadoTr,
    this.horaInicio,
    this.horaFinal,
    this.fkAdminBc,
  });

  String idTipoRecorrido;
  String nombreTr;
  String estadoTr;
  String horaInicio;
  String horaFinal;
  String fkAdminBc;

  factory TipRecorridoResul.fromJson(Map<String, dynamic> json) => TipRecorridoResul(
    idTipoRecorrido: json["idTipoRecorrido"],
    nombreTr: json["nombreTR"],
    estadoTr: json["estadoTR"],
    horaInicio: json["horaInicio"],
    horaFinal: json["horaFinal"],
    fkAdminBc: json["fkAdminBC"],
  );

  Map<String, dynamic> toJson() => {
    "idTipoRecorrido": idTipoRecorrido,
    "nombreTR": nombreTr,
    "estadoTR": estadoTr,
    "horaInicio": horaInicio,
    "horaFinal": horaFinal,
    "fkAdminBC": fkAdminBc,
  };
}
