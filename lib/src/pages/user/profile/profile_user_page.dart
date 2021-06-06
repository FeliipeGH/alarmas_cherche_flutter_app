import 'package:cherche_ultimo/src/pages/user/profile/profile_user_controller.dart';
import 'package:cherche_ultimo/src/rest/requests/profile_user_data_r.dart';
import 'package:cherche_ultimo/src/rest/server/profile_user_data_server.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfileUserPage extends StatefulWidget {
  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  ProfileUserController _con = ProfileUserController();
  Future<ProfileUserDataServer> _showDataCon;

  @override
  void initState() {
    super.initState();
    _showDataCon = dataProfileUserR(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [

        ],
        //leading: ,
      ),
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _showDataCon,
            builder: (BuildContext context,
                AsyncSnapshot<ProfileUserDataServer> snapshot) {
              //print('ttt: $snapshot');
              //print('ttt: ${snapshot.hasData}');
              if (snapshot.hasData) {
                return Container(
                    child: Column(
                  children: [
                    _bannerApp(context),
                    _textTitle(),
                    //SizedBox(height: MediaQuery.of(context).size.height*0.15),
                    _textCorreo('${snapshot.data.correoUc}'),
                    _textContrasenia('${snapshot.data.contraseniaUc}'),
                    _textName('${snapshot.data.nombreUc}'),
                    _textAPaterno('${snapshot.data.aPaternoUc}'),
                    _textAMaterno('${snapshot.data.aMaternoUc}'),

                    _buttonActualizar(
                        correoUc: snapshot.data.correoUc,
                        contraseniaUc: snapshot.data.contraseniaUc,
                        nombreUc: snapshot.data.nombreUc,
                        aPaternoUc: snapshot.data.aPaternoUc,
                        aMaternoUc: snapshot.data.aMaternoUc),
                  ],
                ));
              } else {
                return Container(
                  //todo ver tipos de errores de mi server
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
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
            .height * 0.18,
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

  Widget _textTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Text(
        'Mi Perfil',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }

  Widget _textCorreo(String correo) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.correoController,
        decoration: InputDecoration(
          labelText: 'Correo',
          helperText: 'Correo actual : $correo',
        ),
      ),
    );
  }

  Widget _textContrasenia(String contrasenia) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.contraController,
        decoration: InputDecoration(
          labelText: 'Contraseña',
          helperText: 'Contraseña actual : $contrasenia',
        ),
      ),
    );
  }

  Widget _textName(String nombre) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.nombreController,
        decoration: InputDecoration(
          labelText: 'Nombre',
          helperText: 'Nombre actual : $nombre',
        ),
      ),
    );
  }

  Widget _textAPaterno(String apaterno) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.aPaternoController,
        decoration: InputDecoration(
          labelText: 'Apellido Paterno',
          //hintText: '$apaterno',
          helperText: 'Apellido Paterno actual : $apaterno',
        ),
      ),
    );
  }

  Widget _textAMaterno(String amaterno) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.aMaternoController,
        decoration: InputDecoration(
          labelText: 'Apellido Materno',
          helperText: 'Apellido Materno actual : $amaterno',
        ),
      ),
    );
  }

  Widget _buttonActualizar(
      {String correoUc,
      String contraseniaUc,
      String nombreUc,
      String aPaternoUc,
      String aMaternoUc}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP: () => _con.actualizarData(
          context: context,
          correoUc: correoUc,
          contraseniaUc: contraseniaUc,
          nombreUc: nombreUc,
          aPaternoUc: aPaternoUc,
          aMaternoUc: aMaternoUc
            ),
        text: 'Actualizar',
        color: Colors.black,
        textColor: Colors.white,
      ),
    );
  }
}
