import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/provider/global_provider.dart';
import 'package:cherche_ultimo/src/rest/client/solicitud_inicio_sesion.dart';
import 'package:cherche_ultimo/src/rest/requests/solicitar_inicio_sesion_r.dart';
import 'package:cherche_ultimo/src/utils/my_progress_dialog.dart';
import 'package:cherche_ultimo/src/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserController {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  //objetos que controlan la entrada de texto
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();


  bool checkBox = false;


  void goToRegisterPage(BuildContext context){
    Navigator.pushNamed(context, 'clientRegisterPage');
  }

  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print('Correo: $email, Password: $password');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (email.isEmpty || password.isEmpty){
      Snackbar.showSnackbar(context, key, ' Alguno de los campos se encuentra vacio ');
      return ;
    }


    try{
      String resInicio = await solicitudInicioSesion(
          solicitudInicioSesion: SolicitudInicioSesion(
              opcion: '0', correo: email, contrasenia: password));

      print('resInicio: $resInicio');
      if (resInicio != 'no' ) {


        //damos datos a la variable global
        final GlobalProvider globalProvider =
        Provider.of<GlobalProvider>(context, listen: false);

        globalProvider.usuarioIDV = resInicio;

        //guardar id en la memoria cache

        if(checkBox == true)
        {
          //print(' ======= entro =====');
          sharedPreferences.setString(ID_INICIO_SESION, resInicio);
          //print("sc:  cb:"+ID_INICIO_SESION);
        }
        // para usarlio
        //print('usuario logiado');
        Navigator.pushReplacementNamed(context, 'mainUserPage');

        //print("sc: sin cb "+ID_INICIO_SESION);

      }
      else {
        Snackbar.showSnackbar(context, key, ' Usuario y/o contraseña es incorrecta ');
      }

    }catch (error){
      Snackbar.showSnackbar(context, key, 'Error: $error');
      print('error $error');
    }




  }
}
