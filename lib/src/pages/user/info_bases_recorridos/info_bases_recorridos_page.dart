import 'package:cherche_ultimo/src/pages/user/info_bases/local_components/banner.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/models/base_model.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/info_bases_paradas_page.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_recorridos/info_bases_recorridos_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tipo_recorrido_result.dart';

class InfoBasesRecorridosPage extends StatelessWidget {
  const InfoBasesRecorridosPage._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoBaseRecorridosController(),
      builder: (_, __) => InfoBasesRecorridosPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    InfoBaseRecorridosController infoBaseController =
        Provider.of<InfoBaseRecorridosController>(context);
    final TipoBase tipoBase =
        ModalRoute.of(context).settings.arguments as TipoBase;
    infoBaseController.init(tipoBase);

    if (infoBaseController.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BannerAppBases(),
          BannerAppTitle(),
          Expanded(
            child: ListElements(),
          )
        ],
      ),
    );
  }
}

class ListElements extends StatelessWidget {
  const ListElements({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoBaseRecorridosController infoBaseController =
        Provider.of<InfoBaseRecorridosController>(context, listen: false);
    List<TipRecorridoResul> list = infoBaseController.recorridoList;

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
              child: Text("Sin recorridos para mostrar"),
            ),
    );
  }
}

class ElementContainer extends StatelessWidget {
  final TipRecorridoResul element;

  const ElementContainer({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          builder: (_) =>
              InfoBasesParadasPage.init(context, element.idTipoRecorrido),
          context: context,
        );
      },
      title: Text(
        element.nombreTr,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Text(
            "Estado: ${element.estadoTr}",
          ),
          Text(
            "Hora inicio: ${element.horaInicio}",
          ),
          Text(
            "Hora final: ${element.horaFinal}",
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
