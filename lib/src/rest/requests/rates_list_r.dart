import 'dart:io';
import 'package:cherche_ultimo/src/rest/client/rates_list_client.dart';
import 'package:cherche_ultimo/src/rest/server/rates_list_server.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

Future<List<RatesListServer>> getRatesR() async {
  Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Response response = await dio.post(DIR_TARIFAS,
      data: ratesListClientToJson(RatesListClient(opcion: '1')));

  return ratesListServerFromJson(response.data);
}
