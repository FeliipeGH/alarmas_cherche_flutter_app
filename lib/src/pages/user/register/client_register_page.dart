
import 'package:cherche_ultimo/src/pages/user/register/client_register_controller.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cherche_ultimo/src/utils/colorsP.dart' as utils;

class ClientRegisterPage extends StatefulWidget {
  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {

  ClientRegisterController _con = ClientRegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,

      ),
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(context),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            _textLogin(),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            //_textFielUsername(),
            _textFielEmail(),
            _textFielPassword(),
            _textFielConfirmPassword(),
            _buttonRegister(),
          ],
        ),
      ),

    );
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Colors.grey,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.20,
        child: Row(
          //nos centra el contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_sub_principal.png',
              width: 350,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Registrar',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28
        ),
      ),
    );
  }

  Widget _textFielEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            labelText: 'Correo electronico',
            helperText: 'correo@ejemplo.com',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: utils.ColorsP.cloneColors,
            )
        ),
      ),
    );
  }

  Widget _textFielUsername() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        //controller: _con.usernameController,
        decoration: InputDecoration(
            labelText: 'Nombre de Usuario',
            helperText: 'Lucas David',
            suffixIcon: Icon(
              Icons.person_outline,
              color: utils.ColorsP.cloneColors,
            )
        ),
      ),
    );
  }

  Widget _textFielPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.ColorsP.cloneColors,
            )
        ),
      ),
    );
  }

  Widget _textFielConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.ColorsP.cloneColors,
            )
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP: _con.register,
        text: 'Registrar',
        color: Colors.black,
        textColor:  Colors.white,
      ),
    );
  }


}

