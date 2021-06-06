import 'dart:convert';

DataUserClient dataUserClientFromJson(String str) => DataUserClient.fromJson(json.decode(str));

String dataUserClientToJson(DataUserClient data) => json.encode(data.toJson());

class DataUserClient {
  DataUserClient({
    this.opcion,
    this.idUsuarioComun,
  });

  String opcion;
  String idUsuarioComun;

  factory DataUserClient.fromJson(Map<String, dynamic> json) => DataUserClient(
    opcion: json["opcion"],
    idUsuarioComun: json["idUsuarioComun"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "idUsuarioComun": idUsuarioComun,
  };
}
