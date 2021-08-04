import 'dart:io';

import 'package:cherche_ultimo/src/pages/user/info_bases/constants/BaseUrlConsntants.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/dto/parada_list_request_dto.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/models/base_model.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';

class InfoBaseRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));

  Future<List<TipoBase>> getBaseList() async {
    Response response = await dio.post(DIR_BASE,
        data: paradaListRequestDtoToJson(ParadaListRequestDto(opcion: 1)));
    return tipoBaseFromJson(response.data);
  }
}
