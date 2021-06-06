
import 'package:cherche_ultimo/src/rest/client/register_client.dart';
import 'package:cherche_ultimo/src/rest/requests/register_client_r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cherche_ultimo/src/utils/snackbar.dart';

class ClientRegisterController {
  BuildContext context;
  GlobalKey<ScaffoldState> key =  GlobalKey<ScaffoldState>();
  TextEditingController usernameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmPasswordController =  TextEditingController();


  Future init(BuildContext context) {
    this.context = context;

  }

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();


    print('Correo: $email, Password1: $password');
    print('confirmPassword: $confirmPassword');

    // para saber si un campo no esta vacio
    if (
        email.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty) {
      print('debe ingresar todos los datos');
      //SnackBar.
      Snackbar.showSnackbar(context, key, 'Debe ingresar todos los datos');

      return;
    }
    if (password != confirmPassword) {
      print('Contrasenias no coninciden');
      Snackbar.showSnackbar(context, key, 'Contrasenias no coinciden');
      return;
    }
    if (password.length < 6) {
      print('la contrasenia debe ser mayor a 6 ');
      Snackbar.showSnackbar(context, key, 'La contraseña debe ser mayor a 6 ');
      return;
    }



    try {
      String resRegister = await getRegisteroR(opcion: '1', correoR:email, contraseniaR: password);
      print('resRegistro: $resRegister');
      if (resRegister != 'no') {

        Snackbar.showSnackbar(context, key, 'El usuario se registro correctamente');
        print('El usuario se registro correctamente');
      } else {
        print('El usuario no se a registrado');
      }
    } catch (error) {
      Snackbar.showSnackbar(context, key, 'Error $error');
      print('Error, $error');
    }
  }
}
