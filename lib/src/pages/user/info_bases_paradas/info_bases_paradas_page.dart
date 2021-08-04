import 'package:cherche_ultimo/src/pages/user/info_bases/local_components/banner.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/info_bases_paradas_controller.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/models/puntos_resul.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoBasesParadasPage extends StatelessWidget {
  const InfoBasesParadasPage._();

  static Widget init(BuildContext context, String tipoRecor) {
    return ChangeNotifierProvider(
      create: (_) => InfoBaseParadasController()..init(tipoRecor),
      builder: (_, __) => InfoBasesParadasPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    InfoBaseParadasController infoBaseController =
        Provider.of<InfoBaseParadasController>(context);

    if (infoBaseController.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BannerAppBases(),
            BannerAppTitle(),
            Expanded(
              child: ListElements(),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Cerrar",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListElements extends StatelessWidget {
  const ListElements({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoBaseParadasController infoBaseController =
        Provider.of<InfoBaseParadasController>(context, listen: false);
    List<PuntosResul> list = infoBaseController.list;

    return Container(
      child: list.length > 0
          ? Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (_, int index) {
                  return ElementContainer(element: list[index]);
                },
              ),
            )
          : Container(
              child: Text("Sin paradas para mostrar"),
            ),
    );
  }
}

class ElementContainer extends StatelessWidget {
  final PuntosResul element;

  const ElementContainer({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        element.parada,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Text(
            "Punto Chequeo: ${element.puntoChequeo}",
          ),
          Text(
            "Punto Latitud: ${element.puntoLatitud}",
          ),
          Text(
            "Punto Longitud: ${element.puntoLongitud}",
          ),
          Text(
            "Dirección: ${element.direccion}",
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 28,
      ),
    );
  }
}
