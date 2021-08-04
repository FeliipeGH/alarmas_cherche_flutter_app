import 'package:cherche_ultimo/main.dart';
import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/local_notifications_core/permitions_and_settings.dart';
import 'package:cherche_ultimo/src/pages/user/recordatorios/models/Remind.dart';
import 'package:cherche_ultimo/src/utils/snackbar.dart';
import 'package:cherche_ultimo/src/widget/button_app.dart';
import 'package:cherche_ultimo/src/widget/clock_widget.dart';
import 'package:cherche_ultimo/src/widget/date_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class RecordatoriosUserPage extends StatefulWidget {
  @override
  _RecordatoriosUserPageState createState() => _RecordatoriosUserPageState();
}

class _RecordatoriosUserPageState extends State<RecordatoriosUserPage> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool init = true;
  bool fromEdit = false;
  TimeOfDay hora;
  DateTime fecha;
  String descripcion = "";
  bool cargando = true;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //requestPermissions();
    configureDidReceiveLocalNotificationSubject(context);
    configureSelectNotificationSubject(context);
  }

  @override
  Widget build(BuildContext context) {
    final Remind remind = ModalRoute.of(context).settings.arguments as Remind;
    if (remind != null && init) {
      fromEdit = true;
      setState(() {
        descripcion = remind.description;
        textEditingController.text = remind.description;
        hora = TimeOfDay(hour: remind.hour, minute: remind.minute);
        fecha = remind.date;
      });
      init = false;
    }
    String formatDate(DateTime date) {
      if (date != null) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        return formatter.format(date);
      }
      return null;
    }

    return WillPopScope(
      onWillPop: () async {
        // You can do some work here.
        // Returning true allows the pop to happen, returning false prevents it.
        Navigator.of(context).pushReplacementNamed("recordatoriosUserListPage");
        return false;
      },
      child: Scaffold(
        key: key,
        appBar: AppBar(),
        // permite hacer scrol SingleChildScrollView
        body: SingleChildScrollView(
          child: Column(
            children: [
              _bannerApp(context),
              _textLogin(),
              Container(
                child: DateInput(
                  dataString: formatDate(remind?.date) ?? "",
                  hintText: 'Fecha de recordatorio',
                  labelText: "Fecha de recordatorio",
                  helperText: "Fecha de recordatorio",
                  onChange: (String value) {},
                  helpText: "Selecciona la fecha",
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
                  dataString: hora?.format(context) ?? "",
                  hintText: 'Fecha de recordatorio',
                  labelText: "Fecha de recordatorio",
                  helperText: "Fecha de recordatorio",
                  onChange: (String value) {},
                  helpText: "Fecha de recordatorio",
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
              _buttonLogin(remind),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFielDescripcion() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: textEditingController,
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

  Widget _buttonLogin(Remind remind) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressedP: () {
          if (hora != null && fecha != null && descripcion != "") {
            addNotification(remind);
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

  Future<void> addNotification(Remind remind) async {
    if (remind != null && fromEdit) {
      await flutterLocalNotificationsPlugin.cancel(remind.remindId);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove("$REMIND${remind.remindId}");
    }

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
    Navigator.of(context).pushReplacementNamed("recordatoriosUserListPage");
    Snackbar.showSnackbar(context, key, 'El recordatorio fue agregado');

  }

  Future<int> guardarObtenerNuevoIdNotificacion() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(ALARM_ID)) {
      int currentId = sharedPreferences.getInt(ALARM_ID);
      int newId = currentId + 1;
      sharedPreferences.setInt(ALARM_ID, newId);
      Remind remind = Remind(
        remindId: newId,
        date: fecha,
        hour: hora.hour,
        minute: hora.minute,
        description: descripcion,
      );
      sharedPreferences.setString("$REMIND$newId", remindToJson(remind));
      return newId;
    }
    Remind remind = Remind(
      remindId: 0,
      date: fecha,
      hour: hora.hour,
      minute: hora.minute,
      description: descripcion,
    );
    sharedPreferences.setString("$REMIND" + "0", remindToJson(remind));

    sharedPreferences.setInt(ALARM_ID, 0);
    return 0;
  }
}
