


import 'dart:io';

import 'package:cherche_ultimo/src/rest/client/profile_user_actualizar_client.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

Future<String> actualizarProfileUserR(ProfileUserActualizarClient profileUserActualizarClient) async {
  Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Response response = await dio.post(DIR_PERSONA,
      data: (profileUserActualizarClientToJson(profileUserActualizarClient)));

  //todo verificar como resolver los errores que pueda devolver el servidor

  return response.data;
}
