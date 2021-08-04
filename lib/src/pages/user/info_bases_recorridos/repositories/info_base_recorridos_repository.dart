import 'dart:io';

import 'package:cherche_ultimo/src/pages/user/info_bases/constants/BaseUrlConsntants.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_recorridos/dto/tipo_recorrido_dto.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_recorridos/models/tipo_recorrido_result.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

class InfoBaseRecorridosRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Future<List<TipRecorridoResul>> getRecorridos(String baseName) async {
    Response response = await dio.post(DIR_BASE,
        data: tipRecorridoResulPeticionToJson(
            TipRecorridoResulPeticion(opcion: "2", base: baseName)));
    return tipRecorridoResulFromJson(response.data);
  }
}
