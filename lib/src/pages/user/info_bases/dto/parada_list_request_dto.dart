import 'dart:convert';

ParadaListRequestDto paradaListRequestDtoFromJson(String str) => ParadaListRequestDto.fromJson(json.decode(str));

String paradaListRequestDtoToJson(ParadaListRequestDto data) => json.encode(data.toJson());

class ParadaListRequestDto {
  ParadaListRequestDto({
    this.opcion,
  });

  int opcion;

  factory ParadaListRequestDto.fromJson(Map<String, dynamic> json) => ParadaListRequestDto(
    opcion: json["opcion"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
  };
}
