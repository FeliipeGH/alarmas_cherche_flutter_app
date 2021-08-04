import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final remind = remindFromJson(jsonString);

import 'dart:convert';

Remind remindFromJson(String str) => Remind.fromJson(json.decode(str));

String remindToJson(Remind data) => json.encode(data.toJson());

class Remind {
  Remind({this.remindId, this.date, this.hour, this.minute, this.description});

  int remindId;
  DateTime date;
  String description;
  int hour, minute;

  factory Remind.fromJson(Map<String, dynamic> json) => Remind(
        remindId: json["remindId"],
        date: DateTime.parse(json["date"].toString()),
        hour: json["hour"],
        minute: json["minute"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "remindId": remindId,
        "date": date.toIso8601String(),
        "hour": hour,
        "minute": minute,
        "description": description,
      };

  String getCompleteHour() => "$hour:$minute";

  String getCompleteDate() => "${date.day}/${date.month}/${date.year}";

  @override
  String toString() {
    return 'Remind{remindId: $remindId, date: $date, description: $description, hour: $hour, minute: $minute}';
  }
}
