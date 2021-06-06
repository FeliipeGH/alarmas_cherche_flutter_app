import 'package:flutter/material.dart';

import '../main_transport_controller.dart';

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

  MainTransportController mainTransportController = MainTransportController();

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
                //Navigator.pushNamed(context, 'ratesListPage');
              },
              title: Text('Checados'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {},
              title: Text('Tarifas'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {
                //Navigator.pushNamed(context, 'recordatoriosUserPage');
              },
              title: Text('Reportar colectivo'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            ListTile(
              onTap: () {
                //Navigator.pushNamed(context, 'profileUserPage');
              },
              title: Text('Perfil'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              onTap: () => mainTransportController.cerrarSesion(context: context),
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              //subtitle: Text("hhh"),
            ),

          ],
        ),
      ),
    );
  }
}
