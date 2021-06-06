
import 'dart:convert';

ProfileUserDataClient profileUserDataClientFromJson(String str) => ProfileUserDataClient.fromJson(json.decode(str));

String profileUserDataClientToJson(ProfileUserDataClient data) => json.encode(data.toJson());

class ProfileUserDataClient {
  ProfileUserDataClient({
    this.opcion,
    this.idUsuarioComun,
  });

  String opcion;
  String idUsuarioComun;

  factory ProfileUserDataClient.fromJson(Map<String, dynamic> json) => ProfileUserDataClient(
    opcion: json["opcion"],
    idUsuarioComun: json["idUsuarioComun"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "idUsuarioComun": idUsuarioComun,
  };
}
