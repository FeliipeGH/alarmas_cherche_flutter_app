import 'package:cherche_ultimo/src/pages/user/info_bases/info_bases_controller.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/local_components/banner.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/models/base_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoBasesPage extends StatelessWidget {
  const InfoBasesPage._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoBaseController()..init(),
      builder: (_, __) => InfoBasesPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    InfoBaseController infoBaseController =
        Provider.of<InfoBaseController>(context);

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
            child: BaseList(),
          )
        ],
      ),
    );
  }
}

class BaseList extends StatelessWidget {
  const BaseList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoBaseController infoBaseController =
        Provider.of<InfoBaseController>(context, listen: false);
    List<TipoBase> baseList = infoBaseController.baseList;

    return Container(
      child: baseList.length > 0
          ? Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: baseList.length,
                itemBuilder: (_, int index) {
                  return BaseContainer(baseModel: baseList[index]);
                },
              ),
            )
          : Container(
              child: Text("Sin bases para mostrar"),
            ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  final TipoBase baseModel;

  const BaseContainer({Key key, @required this.baseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed("infoBasesRecorridosPage",
            arguments: baseModel);
      },
      title: Text(
        baseModel.nombreBc,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        baseModel.correoBc,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 28,
      ),
    );
  }
}
