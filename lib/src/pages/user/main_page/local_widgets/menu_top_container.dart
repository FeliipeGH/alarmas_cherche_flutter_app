import 'package:flutter/material.dart';

import '../main_user_controller.dart';

class MenuTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //que se encuentre en el area segura, no se sobre ponga en la barra de estado
    return SafeArea(
      child: Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          iconSize: 40,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => showMenuDialog(context)),
      ),
    );
  }
}

void showMenuDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => MenuDialog());
}

class MenuDialog extends StatelessWidget {

  MainUserController mainUserController = MainUserController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'scheduleListPage');
              },
              title: Text('Horarios'),
              leading: Icon(Icons.watch_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'ratesListPage');
              },
              title: Text('Tarifas'),
              leading: Icon(Icons.attach_money_sharp),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {},
              title: Text('Calificar'),
              leading: Icon(Icons.verified_outlined ),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'recordatoriosUserListPage');
              },
              title: Text('Recodatorios'),
              leading: Icon(Icons.add_alert_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'profileUserPage');
              },
              title: Text('Perfil'),
              leading: Icon(Icons.assignment_ind_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              onTap: () => mainUserController.cerrarSesion(context: context),
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.login),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),

          ],
        ),
      ),
    );
  }
}
