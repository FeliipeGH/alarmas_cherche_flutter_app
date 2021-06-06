import 'dart:io';

import 'package:cherche_ultimo/src/rest/client/register_client.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

Future<String> getRegisteroR({String opcion , String correoR, String contraseniaR}) async {
  Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Response response = await dio.post(DIR_PERSONA,
      data: (registerUserClientToJson(RegisterUserClient(
          opcion: opcion,
          correoR: correoR,
          contraseniaR: contraseniaR,
          nomPersonaR: '',
          generoR: '',
          fechaNr: '',
          aPaternoR: '',
          aMaternoR: ''
      ))));

  return response.data;
}
