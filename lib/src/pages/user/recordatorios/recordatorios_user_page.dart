import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/local_notifications_core/permitions_and_settings.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:cherche_ultimo/src/widget/clock_widget.dart';
import 'package:cherche_ultimo/src/widget/date_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../../main.dart';

class RecordatoriosUserPage extends StatefulWidget {
  @override
  _RecordatoriosUserPageState createState() => _RecordatoriosUserPageState();
}

class _RecordatoriosUserPageState extends State<RecordatoriosUserPage> {
  TimeOfDay hora;
  DateTime fecha;
  String descripcion = "";
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    configureDidReceiveLocalNotificationSubject(context);
    configureSelectNotificationSubject(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // permite hacer scrol SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(context),
            _textLogin(),
            Container(
              child: DateInput(
                dataString: "",
                hintText: 'Fecha de recordatorio',
                labelText: "Fecha de recordatorio",
                helperText: "Fecha de recordatorio",
                onChange: (String value) {},
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
                dataString: "",
                hintText: 'Fecha de recordatorio',
                labelText: "Fecha de recordatorio",
                helperText: "Fecha de recordatorio",
                onChange: (String value) {},
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
            _textFielDescripcion(),
            _buttonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _textFielDescripcion() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Descripción',
            helperText: 'Detalles del recordatorio',
            prefix: Icon(
              Icons.analytics_sharp,
            )),
        onChanged: (String value) {
          descripcion = value;
        },
      ),
    );
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height * 0.18,
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
            color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 28),
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
            )),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP: () {
          if (hora != null && fecha != null && descripcion != "") {
            addNotification();

          }
        },
        text: 'Guuardar',
        color: Colors.black,
        textColor: Colors.white,
      ),
    );
  }

  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> addNotification() async {
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, fecha.year, fecha.month, fecha.day, hora.hour, hora.minute);
    int id = await guardarObtenerNuevoIdNotificacion();

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Recordatorio',
        descripcion,
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
    print('notificacion agregada');
  }

  Future<int> guardarObtenerNuevoIdNotificacion() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(ALARM_ID)) {
      int currentId = sharedPreferences.getInt(ALARM_ID);
      int newId = currentId + 1;
      sharedPreferences.setInt(ALARM_ID, newId);
      return newId;
    }
    sharedPreferences.setInt(ALARM_ID, 0);
    return 0;
  }
}
