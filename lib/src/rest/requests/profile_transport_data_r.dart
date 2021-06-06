import 'dart:io';
import 'dart:js';
import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/provider/global_provider.dart';
import 'package:cherche_ultimo/src/rest/client/profile_transport_data_client.dart';
import 'package:cherche_ultimo/src/rest/server/profile_transport_data_server.dart';
import 'package:cherche_ultimo/src/rest/service_php/service_php.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <ProfileTransporDataC> showDataTransport (BuildContext context) async{
  Dio dio = Dio(BaseOptions(
    baseUrl: SERVICE_IP,
    headers: {HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"},
  ));


  final GlobalProvider globalProvider =
  Provider.of<GlobalProvider>(context, listen: false);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUsuarioV = sharedPreferences.getString(ID_INICIO_SESION);


  String idTransportista = globalProvider.usuarioIDV;
  print('idTransportista r: $idTransportista');
  print('idUsuarioV r: $idUsuarioV');
  print('ID_INICIO_SESION: $ID_INICIO_SESION');

  if (idTransportista ==null)
  {
    idTransportista = idUsuarioV;
  }

  Response response = await dio.post(DIR_PERSONA,
      data: profileTransporDataClieToJson(ProfileTransporDataClie(opcion: '2',idTransportista: idTransportista) ));

  //print('tttpppp: ${response.data}');
  //todo verificar como resolver los errores que pueda devolver el servidor

  //print('ooooo : ${profileUserDataServerFromJson(response.data)}');
  return profileTransporDataCFromJson(response.data);


}


