import 'dart:convert';

ScheduleListClient scheduleListClientFromJson(String str) => ScheduleListClient.fromJson(json.decode(str));

String scheduleListClientToJson(ScheduleListClient data) => json.encode(data.toJson());

class ScheduleListClient {
  ScheduleListClient({
    this.opcion,
  });

  String opcion;

  factory ScheduleListClient.fromJson(Map<String, dynamic> json) => ScheduleListClient(
    opcion: json["opcion"],
  );

  Map<String, dynamic> toJson() => {
    "opcion": opcion,
  };
}
