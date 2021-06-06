
import 'dart:convert';

List<RatesListServer> ratesListServerFromJson(String str) => List<RatesListServer>.from(json.decode(str).map((x) => RatesListServer.fromJson(x)));

String ratesListServerToJson(List<RatesListServer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatesListServer {
  RatesListServer({
    this.costoT,
    this.nombreTr,
    this.nombreBc,
  });

  String costoT;
  String nombreTr;
  String nombreBc;

  factory RatesListServer.fromJson(Map<String, dynamic> json) => RatesListServer(
    costoT: json["costoT"],
    nombreTr: json["nombreTR"],
    nombreBc: json["nombreBC"],
  );

  Map<String, dynamic> toJson() => {
    "costoT": costoT,
    "nombreTR": nombreTr,
    "nombreBC": nombreBc,
  };
}
