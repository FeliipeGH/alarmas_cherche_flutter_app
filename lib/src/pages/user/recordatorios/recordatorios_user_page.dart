import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:cherche_ultimo/src/widget/clock_widget.dart';
import 'package:cherche_ultimo/src/widget/date_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class RecordatoriosUserPage extends StatefulWidget {
  @override
  _RecordatoriosUserPageState createState() => _RecordatoriosUserPageState();
}



class _RecordatoriosUserPageState extends State<RecordatoriosUserPage> {


  TimeOfDay  hora;
  DateTime fecha;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(context),
            _textLogin(),
            Container(
              child: DateInput(
                dataString:  "",
                hintText: 'Fecha de recordatorio',
                labelText: "Fecha de recordatorio",
                helperText: "Fecha de recordatorio",
                onChange: (String value) {
                },
                helpText: "Selecciona la caducidad del producto",
                errorText: "",
                thenDateFunction: (DateTime date) {
                  print('======== Aqui DATA=========');
                  print(date);
                  fecha = date;
                },
                lastDate: DateTime.now().add(Duration(days: 360 * 100)),
              ),
            ),
            Container(
              child: ClockInput(
                dataString:  "",
                hintText: 'Fecha de recordatorio',
                labelText: "Fecha de recordatorio",
                helperText: "Fecha de recordatorio",
                onChange: (String value) {
                },
                helpText: "Selecciona la caducidad del producto",
                errorText: "",
                thenDateFunction: (TimeOfDay date) {
                  print('======== Aqui clock=========');
                  print(date);
                  hora = date;
                },
                lastDate: DateTime.now().add(Duration(days: 360 * 100)),
              ),
            ),
            _buttonLogin(),

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
            .height * 0.18,
        child: Row(
          //nos centra el contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                'assets/img/logo_sub_principal.png',
                width: 300,
                height: 90,
              ),
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
        'Recordatorios',
        style: TextStyle(
            color: Colors.blue[900],
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
        //controller: _con.emailController,
        decoration: InputDecoration(
            labelText: 'Descripcion',
            //helperText: 'correo@ejemplo.com',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: Colors.blue,
            )
        ),
      ),
    );
  }
  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP:(){
          if (hora != null && fecha != null){
            print('Hora $hora');
            print('fecha $fecha');
          }
        },
        text: 'Guuardar',
        color: Colors.black,
        textColor:  Colors.white,
      ),
    );
  }
}
