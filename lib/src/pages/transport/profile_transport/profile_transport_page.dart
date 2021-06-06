/*
import 'package:cherche_ultimo/src/pages/transport/profile_transport/profile_transport_controller.dart';
import 'package:cherche_ultimo/src/rest/requests/profile_transport_data_r.dart';
import 'package:cherche_ultimo/src/rest/server/profile_transport_data_server.dart';
import 'package:cherche_ultimo/src/rest/server/profile_user_data_server.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileTransportPage extends StatefulWidget {
  @override
  _ProfileTransportPageState createState() => _ProfileTransportPageState();
}

class _ProfileTransportPageState extends State<ProfileTransportPage> {
  ProfileTransportController _con = ProfileTransportController();
  Future<ProfileTransporDataC> _showDataCon;

  @override
  void initState() {
    super.initState();
    _showDataCon = showDataTransport(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          //Image.asset('assets/img/logo_sub_principal.png')
        ],
        //leading: ,
      ),
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _showDataCon,
            builder: (BuildContext context,
                AsyncSnapshot<ProfileTransporDataC> snapshot) {
              //print('ttt: $snapshot');
              //print('ttt: ${snapshot.hasData}');
              if (snapshot.hasData) {
                return Container(
                    child: Column(
                  children: [
                    _textTitle(),
                    //SizedBox(height: MediaQuery.of(context).size.height*0.15),
                    _textCorreo('${snapshot.data.correoT}'),
                    _textContrasenia('${snapshot.data.contraseniaT}'),
                    _textName('${snapshot.data.nombreT}'),
                    _textAPaterno('${snapshot.data}'),
                    _textAMaterno('${snapshot.data}'),

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
          helperText: 'Actual : $correo',
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
          helperText: 'Actual : $contrasenia',
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
          helperText: 'Actual : $nombre',
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
          hintText: '$apaterno',
          //helperText: 'Actual : $apaterno',
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
          helperText: 'Actual : $amaterno',
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
*/
