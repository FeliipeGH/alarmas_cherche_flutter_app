import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUserController{
  void nomUsuario({BuildContext context, int index}){
    print('Index  : $index');
  }

  void cerrarSesion({BuildContext context}) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String idUsuarioV = null;
    sharedPreferences.setString(ID_INICIO_SESION, 'ID_INICIO_SESION');
    Navigator.pushReplacementNamed(context, 'loginUser');
  }

}





