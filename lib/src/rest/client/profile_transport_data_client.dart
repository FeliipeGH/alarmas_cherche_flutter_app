


import 'dart:convert';

ProfileTransporDataClie profileTransporDataClieFromJson(String str) => ProfileTransporDataClie.fromJson(json.decode(str));

String profileTransporDataClieToJson(ProfileTransporDataClie data) => json.encode(data.toJson());

class ProfileTransporDataClie {
  ProfileTransporDataClie({
    this.opcion,
    this.idTransportista,
  });

  String opcion;
  String idTransportista;

  factory ProfileTransporDataClie.fromJson(Map<String, dynamic> json) => ProfileTransporDataClie(
    opcion: json["opcion"],
    idTransportista: json["idTransportista"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
    "idTransportista": idTransportista,
  };
}
