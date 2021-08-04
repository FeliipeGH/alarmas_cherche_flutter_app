import 'dart:convert';

PuntosResulPeticion puntosResulPeticionFromJson(String str) => PuntosResulPeticion.fromJson(json.decode(str));

String puntosResulPeticionToJson(PuntosResulPeticion data) => json.encode(data.toJson());

class PuntosResulPeticion {
  PuntosResulPeticion({
    this.opcion,
    this.tipoRecor,
  });

  String opcion;
  String tipoRecor;

  factory PuntosResulPeticion.fromJson(Map<String, dynamic> json) => PuntosResulPeticion(
    opcion: json["opcion"],
    tipoRecor: json["tipoRecor"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "tipoRecor": tipoRecor,
  };
}
