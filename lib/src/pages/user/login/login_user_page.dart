import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/pages/user/login/login_user_controller.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cherche_ultimo/src/utils/colorsP.dart' as utils;

class LoginUserPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginUserPage> {


  LoginUserController _con = LoginUserController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _con.key,
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(context),
            _textLogin(),
            SizedBox(height: MediaQuery.of(context).size.height*0.15),
            _textFielEmail(),
            _textFielPassword(),
            _checkBox(),
            _buttonLogin(),
            _textDontHaveAccount(),
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
            .height * 0.29,
        child: Row(
          //nos centra el contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                'assets/img/logo_sub_principal.png',
                width: 350,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Iniciar Sesion',
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

  Widget _textFielPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.ColorsP.cloneColors,
            )
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP:()=> _con.login(context),
        text: 'Iniciar Sesion',
        color: Colors.black,
        textColor:  Colors.white,
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return GestureDetector(
      onTap: ()=> _con.goToRegisterPage(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          'No tienes Cuenta?',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }


  Widget _checkBox (){
    return Row(
      children: [
        Checkbox(
          value: _con.checkBox,
          onChanged: (bool value){
            setState(() {
              _con.checkBox = value;
            });
          },
        ),
        Text('Iniciar sesion automaticamente ')
      ],
    );
  }

}

