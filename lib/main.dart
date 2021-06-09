import 'package:cherche_ultimo/src/local_notifications_core/init_functions.dart';
import 'package:cherche_ultimo/src/local_notifications_core/received_notification.dart';
import 'package:cherche_ultimo/src/pages/home/home_page.dart';
import 'package:cherche_ultimo/src/pages/splash_screen/splash_screen.dart';
import 'package:cherche_ultimo/src/pages/transport/login/login_transport_page.dart';
import 'package:cherche_ultimo/src/pages/transport/main_transport_page/main_transport_page.dart';
import 'package:cherche_ultimo/src/pages/user/login/login_user_page.dart';
import 'package:cherche_ultimo/src/pages/user/main_page/main_user_page.dart';
import 'package:cherche_ultimo/src/pages/user/profile/profile_user_page.dart';
import 'package:cherche_ultimo/src/pages/user/rates/rates_list.dart';
import 'package:cherche_ultimo/src/pages/user/recordatorios/recordatorios_user_page.dart';
import 'package:cherche_ultimo/src/pages/user/register/client_register_page.dart';
import 'package:cherche_ultimo/src/pages/user/schedule/schedule_list.dart';
import 'package:cherche_ultimo/src/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

/***
 *  Inicialización de las notificaciones locales
 ***/

// inicializar las notificaciones locales
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Las transmisiones se crean para que la aplicación pueda responder a eventos relacionados con notificaciones
/// ya que el complemento se inicializa en la función `main`
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

String selectedNotificationPayload;
/***
 *  Inicialización de las notificaciones locales
 ***/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLocalNotifications();
  runApp(MyApp());
}

//es una clase que heredan las pantallas
class MyApp extends StatefulWidget {
  @override
  //metodo que crear un estado de tipo _MyAppState
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => GlobalProvider())],
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('es', 'MX'),
          ],
          // remueve mensaje de debug
          debugShowCheckedModeBanner: false,
          title: 'Cherche Transport ',
          initialRoute: 'recordatoriosUserPage',
          theme: ThemeData(
            fontFamily: 'NimbusSans',
            //para quitar la barra superior
            appBarTheme: AppBarTheme(elevation: 0),
            primaryColor: Colors.grey,
          ),
          routes: {
            'splashScreen': (BuildContext context) => SplashScreen(),
            'home': (BuildContext context) => HomePage(),

            //all user
            'loginUser': (BuildContext context) => LoginUserPage(),
            'clientRegisterPage': (BuildContext context) =>
                ClientRegisterPage(),
            'mainUserPage': (BuildContext context) => MainUserPage(),
            'scheduleListPage': (BuildContext context) => ScheduleListPage(),
            'ratesListPage': (BuildContext context) => RatesListPage(),
            'profileUserPage': (BuildContext context) => ProfileUserPage(),
            'recordatoriosUserPage': (BuildContext context) =>
                RecordatoriosUserPage(),

            //all transport
            'loginTransportPage': (BuildContext context) =>
                LoginTransportPage(),
            'mainTransportPage': (BuildContext context) => MainTransportPage(),
          }),
    );
  }
}
