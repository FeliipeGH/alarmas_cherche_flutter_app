import 'dart:io';
import 'package:cherche_ultimo/src/rest/client/schedule_list_client.dart';
import 'package:cherche_ultimo/src/rest/server/schedule_list_server.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

Future<List<ScheduleListServer>> listScheduleR() async {
  Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Response response = await dio.post(DIR_HORARIOS,
      data: scheduleListClientToJson(ScheduleListClient(opcion: "1")));

  return scheduleListServerFromJson(response.data);
}
