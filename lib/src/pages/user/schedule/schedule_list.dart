import 'package:cherche_ultimo/src/rest/requests/schedule_list_r.dart';
import 'package:cherche_ultimo/src/rest/server/schedule_list_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ScheduleListPage extends StatefulWidget {
  @override
  _ScheduleListPageState createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  Future<List<ScheduleListServer>> obtenerLista;

  //todo revisar ciclo de vida da la app
  @override
  void initState() {
    super.initState();
    obtenerLista = listScheduleR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        //leading: ,
      ),
      body: Container(
        child: FutureBuilder(
          future: obtenerLista,
          builder: (BuildContext context,
              AsyncSnapshot<List<ScheduleListServer>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListaElementos(
                  listElementos: snapshot.data,
                ),
              );
            } else {
              return Container(
                //todo ver tipos de errores de mi server
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}

class ListaElementos extends StatefulWidget {
  final List<ScheduleListServer> listElementos;

  const ListaElementos({Key key, this.listElementos}) : super(key: key);

  @override
  _ListaElementosState createState() => _ListaElementosState();
}

class _ListaElementosState extends State<ListaElementos> {
  List<ScheduleListServer> showListElement = [];

  @override
  void initState() {
    super.initState();
    //iniciar lista aux para el buscador
    showListElement.addAll(widget.listElementos);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              onChanged: (String buscarText) {
                setState(() {
                  showListElement = widget.listElementos
                      .where((element) =>
                          element.nombreBc
                              .toLowerCase()
                              .contains(buscarText.toLowerCase()) ||
                          element.nombreTr
                              .toLowerCase()
                              .contains(buscarText.toLowerCase()))
                      .toList();
                });
              },
              //controller: _con.emailController,
              decoration: InputDecoration(
                  labelText: 'Buscar',
                  helperText: 'Buscar',
                  suffixIcon: Icon(
                    Icons.search,
                    //color: utils.ColorsP.cloneColors,
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: showListElement.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    //padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(showListElement[index].nombreBc)),
                          Expanded(
                              child: Text(showListElement[index].nombreTr)),
                          Expanded(
                              child: Text(showListElement[index].horaInicio)),
                          Expanded(
                              child: Text(showListElement[index].horaFinal)),
                        ],
                      )
                    ]),
                  );
                }),
          ),
        ],
      ),
    );
  }

}
