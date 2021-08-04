import 'dart:convert';

TipRecorridoResulPeticion tipRecorridoResulPeticionFromJson(String str) => TipRecorridoResulPeticion.fromJson(json.decode(str));

String tipRecorridoResulPeticionToJson(TipRecorridoResulPeticion data) => json.encode(data.toJson());

class TipRecorridoResulPeticion {
  TipRecorridoResulPeticion({
    this.opcion,
    this.base,
  });

  String opcion;
  String base;

  factory TipRecorridoResulPeticion.fromJson(Map<String, dynamic> json) => TipRecorridoResulPeticion(
    opcion: json["opcion"],
    base: json["base"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "base": base,
  };
}
