import 'dart:convert';

SolicitudInicioSesion solicitudInicioSesionFromJson(String str) =>
    SolicitudInicioSesion.fromJson(json.decode(str));

String solicitudInicioSesionToJson(SolicitudInicioSesion data) =>
    json.encode(data.toJson());

class SolicitudInicioSesion {
  SolicitudInicioSesion({
    this.opcion,
    this.correo,
    this.contrasenia,
  });

  String opcion;
  String correo;
  String contrasenia;

  factory SolicitudInicioSesion.fromJson(Map<String, dynamic> json) =>
      SolicitudInicioSesion(
        opcion: json["opcion"],
        correo: json["correo"],
        contrasenia: json["contrasenia"],
      );

  Map<String, dynamic> toJson() => {
        "opcion": opcion,
        "correo": correo,
        "contrasenia": contrasenia,
      };
}
