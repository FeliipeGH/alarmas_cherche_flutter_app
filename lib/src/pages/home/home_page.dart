
import 'package:cherche_ultimo/src/pages/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _con = new HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      // SafeArea PERMITE QUE EL CONTENIDO ESTE DENTRO DE LA AREA DE LA APP Y NO PASE AL MENU DE LA APP
      body:  SafeArea(
        child: Column(
          children:[
            _bannerApp(context),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              child: _textSelectYourRol('Tipo de Usuario'),
            ),
            SizedBox(height: 30),
            //colocar una imagen circular
            _imgTypeUser (context, 'assets/img/pasajero.png', 'typeUser'),
            SizedBox(height: 10),
            _textTypeUser('Usuario del Transporte'),

            SizedBox(height: 30),
      _imgTypeUser (context, 'assets/img/driver.png', 'typeTransport'),
            SizedBox(height: 10),
            _textTypeUser('Transportista'),
          ],
        ),
      ),
    );
  }


  Widget _bannerApp(BuildContext context){
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_sub_principal.png',
              width: 250,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textTypeUser(String textP){
    return Text(textP,
        style: TextStyle(
            color: Colors.white,
            fontSize: 17
        )
    );
  }

  Widget _imgTypeUser(BuildContext context, String imgText, String typeUser){
    return GestureDetector(
      onTap: ()=>_con.goToLoginPage(context,typeUser),
      child: CircleAvatar(
        backgroundImage: AssetImage(imgText),
        radius: 50,
        backgroundColor:  Colors.grey[900],
      ),
    );
  }
  Widget _textSelectYourRol (String rolText)
  {
    return Text(rolText,
      style: TextStyle(
        color: Colors.white,
        fontFamily:  'Pacifico',
        fontWeight: FontWeight.bold,
        fontSize: 17,

      ),
    );
  }


}






