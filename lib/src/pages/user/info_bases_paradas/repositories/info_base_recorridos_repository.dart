import 'dart:io';

import 'package:cherche_ultimo/src/pages/user/info_bases/constants/BaseUrlConsntants.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/dto/puntos_resul_dto.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/models/puntos_resul.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

class InfoBaseParadasRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Future<List<PuntosResul>> getList(String tipoRecor) async {
    Response response = await dio.post(DIR_BASE,
        data: puntosResulPeticionToJson(
            PuntosResulPeticion(opcion: "3", tipoRecor: tipoRecor)));
    return puntosResulFromJson(response.data);
  }
}
