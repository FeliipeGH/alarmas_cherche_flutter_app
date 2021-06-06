import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/provider/global_provider.dart';
import 'package:cherche_ultimo/src/rest/client/solicitud_inicio_sesion.dart';
import 'package:cherche_ultimo/src/rest/requests/solicitar_inicio_sesion_r.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginTransportController {

  //objetos que controlan la entrada de texto
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();


  bool checkBox = false;

  void login(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    print('Correo: $email, Password: $password');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String resInicio = await solicitudInicioSesion(
        solicitudInicioSesion: SolicitudInicioSesion(
            opcion: '4', correo: email, contrasenia: password));

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
      Navigator.pushReplacementNamed(context, 'mainTransportPage');

     //print("sc: sin cb "+ID_INICIO_SESION);

    }
  }
}
