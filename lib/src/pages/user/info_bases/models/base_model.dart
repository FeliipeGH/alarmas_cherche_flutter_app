import 'dart:convert';

List<TipoBase> tipoBaseFromJson(String str) => List<TipoBase>.from(json.decode(str).map((x) => TipoBase.fromJson(x)));

String tipoBaseToJson(List<TipoBase> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoBase {
  TipoBase({
    this.idAdminBc,
    this.correoBc,
    this.contraseniaBc,
    this.nombreBc,
  });

  String idAdminBc;
  String correoBc;
  String contraseniaBc;
  String nombreBc;

  factory TipoBase.fromJson(Map<String, dynamic> json) => TipoBase(
    idAdminBc: json["idAdminBC"],
    correoBc: json["correoBC"],
    contraseniaBc: json["contraseniaBC"],
    nombreBc: json["nombreBC"],
  );

  Map<String, dynamic> toJson() => {
    "idAdminBC": idAdminBc,
    "correoBC": correoBc,
    "contraseniaBC": contraseniaBc,
    "nombreBC": nombreBc,
  };
}