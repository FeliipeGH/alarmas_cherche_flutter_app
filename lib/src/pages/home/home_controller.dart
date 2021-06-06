import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController{
  void goToLoginPage(BuildContext context,String typeUser) async{



    if (typeUser == 'typeUser')
      {
        Navigator.pushNamed(context, 'loginUser');
        //guardar id en la memoria cache
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString(TYPE_USER, typeUser);
        print(typeUser);
    }
    else if(typeUser == 'typeTransport'){
      Navigator.pushNamed(context, 'loginTransportPage');
      //guardar id en la memoria cache
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(TYPE_USER, typeUser);
      print(typeUser);
    }



  }

}








