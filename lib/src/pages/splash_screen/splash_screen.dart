
import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//ventana de carga al inicio de la app
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Cargando"),
        ),
      ),
    );
  }

  @override
  void initState() {
    // esperar a que la pagina cargue
    WidgetsBinding.instance.addPostFrameCallback((_) {
      typeUser();
    });
    super.initState();
  }

  void typeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String opcion = sharedPreferences.getString(TYPE_USER);
    String idUsuarioV = sharedPreferences.getString(ID_INICIO_SESION);

    print('1opcion: $opcion');
    print('idUsuarioV: $idUsuarioV');
    print('ID_INICIO_SESION: $ID_INICIO_SESION');

    if (opcion != null) {
      print('kkkkk');
      if (opcion == 'typeUser') {
        print('2opcion $opcion');

        print('idUsuarioV : $idUsuarioV');

        if(idUsuarioV ==null || idUsuarioV  == 'ID_INICIO_SESION')
          {
            print('2 ID_INICIO_SESION: $ID_INICIO_SESION');
            Navigator.pushReplacementNamed(context, 'loginUser');
          }
        else
          {
            print('idUsuarioV: $idUsuarioV');
            print('3 ID_INICIO_SESION: $ID_INICIO_SESION');
            Navigator.pushReplacementNamed(context, 'mainUserPage');
          }
      } else {
        print('3opcion $opcion');
        print('Transportista');
        if(idUsuarioV ==null || idUsuarioV  == 'ID_INICIO_SESION'){
          print('4 ID_INICIO_SESION: $ID_INICIO_SESION');
          Navigator.pushReplacementNamed(context, 'loginTransportPage');
        }
        else {
          print('5 ID_INICIO_SESION: $ID_INICIO_SESION');
          Navigator.pushReplacementNamed(context, 'mainTransportPage');
        }
      }
    }
    else {
      print('home');
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}


