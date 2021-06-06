import 'dart:convert';

RatesListClient ratesListClientFromJson(String str) => RatesListClient.fromJson(json.decode(str));

String ratesListClientToJson(RatesListClient data) => json.encode(data.toJson());

class RatesListClient {
  RatesListClient({
    this.opcion,
  });

  String opcion;

  factory RatesListClient.fromJson(Map<String, dynamic> json) => RatesListClient(
    opcion: json["opcion"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
  };
}
