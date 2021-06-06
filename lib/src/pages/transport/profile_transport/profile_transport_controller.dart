/*
import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/rest/client/profile_user_actualizar_client.dart';
import 'package:cherche_ultimo/src/rest/requests/profile_user_actualizar_r.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTransportController {

  //objetos que controlan la entrada de texto
  TextEditingController correoController = TextEditingController();
  TextEditingController contraController = TextEditingController();
  TextEditingController aPaternoController = TextEditingController();
  TextEditingController aMaternoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();


  ProfileTransportActualizarClient actData = ProfileTransportActualizarClient();

  void actualizarData({BuildContext context, String correoUc,
    String contraseniaUc,
    String nombreUc,
    String aPaternoUc,
    String aMaternoUc}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String idUsuarioV = sharedPreferences.getString(ID_INICIO_SESION);

    actData.correoUc = correoUc;
    actData.contraseniaUc = contraseniaUc;
    actData.nombreUc = nombreUc;
    actData.aPaternoUc = aPaternoUc;
    actData.aMaternoUc = aMaternoUc;

    actData.opcion = '3';
    actData.fechaNacUc = '';
    actData.generoUc = '';

    //datosUser = ProfileUserDataServer();
    //print(datosUser.);
    actData.idUsuarioComun = idUsuarioV;

    if (correoController.text != '') {
      actData.correoUc = correoController.text;

      if (contraController.text != '') {
        actData.contraseniaUc = contraController.text;


        if (nombreController.text != '') {
          actData.nombreUc = nombreController.text;
        }

        if (aPaternoController.text != '') {
          actData.aPaternoUc = aPaternoController.text;
        }

        if (aMaternoController.text != '') {
          actData.aMaternoUc = aMaternoController.text;
        }


        print(actData);

        print('=========== idUsuarioV ========== $idUsuarioV');

        String res = await actualizarProfileTransportR(actData);

        print(res);
      }
    }
  }
  }*/
