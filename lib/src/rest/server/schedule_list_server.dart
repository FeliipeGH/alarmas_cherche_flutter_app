
import 'dart:convert';

List<ScheduleListServer> scheduleListServerFromJson(String str) => List<ScheduleListServer>.from(json.decode(str).map((x) => ScheduleListServer.fromJson(x)));

String scheduleListServerToJson(List<ScheduleListServer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleListServer {
  ScheduleListServer({
    this.nombreBc,
    this.nombreTr,
    this.horaInicio,
    this.horaFinal,
  });

  String nombreBc;
  String nombreTr;
  String horaInicio;
  String horaFinal;

  factory ScheduleListServer.fromJson(Map<String, dynamic> json) => ScheduleListServer(
    nombreBc: json["nombreBC"],
    nombreTr: json["nombreTR"],
    horaInicio: json["horaInicio"],
    horaFinal: json["horaFinal"],
  );

  Map<String, dynamic> toJson() => {
    "nombreBC": nombreBc,
    "nombreTR": nombreTr,
    "horaInicio": horaInicio,
    "horaFinal": horaFinal,
  };
}
