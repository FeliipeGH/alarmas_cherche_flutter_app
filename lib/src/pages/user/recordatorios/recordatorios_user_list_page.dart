import 'package:cherche_ultimo/main.dart';
import 'package:cherche_ultimo/src/pages/user/recordatorios/models/Remind.dart';
import 'package:cherche_ultimo/src/pages/user/recordatorios/reordatorio_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordatoriosUserListPage extends StatelessWidget {
  const RecordatoriosUserListPage._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecordatorioUserController()..initController(),
      builder: (_, __) => RecordatoriosUserListPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    RecordatorioUserController recordatorioUserController =
        Provider.of<RecordatorioUserController>(context);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: !recordatorioUserController.loading
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("recordatoriosUserPage");
              },
              child: Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          _bannerApp(context),
          _textLogin(),
          Expanded(
            child: recordatorioUserController.loading
                ? Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const ReminderList(),
          )
        ],
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
}

class ReminderList extends StatelessWidget {
  const ReminderList();

  @override
  Widget build(BuildContext context) {
    RecordatorioUserController recordatorioUserController =
        Provider.of<RecordatorioUserController>(context);
    List<Remind> pendingList = recordatorioUserController.remindList;

    return Container(
      child: pendingList.length == 0
          ? Center(
              child: Text(
              "Sin recordatorios",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ))
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: pendingList.length,
              itemBuilder: (_, int index) {
                return NotificationItem(
                  remind: pendingList[index],
                );
              },
            ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Remind remind;

  const NotificationItem({Key key, @required this.remind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecordatorioUserController recordatorioUserController =
        Provider.of<RecordatorioUserController>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Card(
            elevation: 1.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                "${remind.description}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Fecha: ${remind.getCompleteDate()}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Hora: ${remind.getCompleteHour()}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                              "recordatoriosUserPage",
                              arguments: remind);
                        },
                        child: Text("Editar"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () => recordatorioUserController
                            .deleteRemind(remind.remindId),
                        child: Text("Eliminar"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
