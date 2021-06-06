import 'package:cherche_ultimo/src/rest/requests/rates_list_r.dart';
import 'package:cherche_ultimo/src/rest/server/rates_list_server.dart';
import 'package:flutter/material.dart';

class RatesListPage extends StatefulWidget {
  @override
  _RatesListPageState createState() => _RatesListPageState();
}

class _RatesListPageState extends State<RatesListPage> {

  Future<List<RatesListServer>> obtenerLista;

  //todo revisar ciclo de vida da la app
  @override
  void initState() {
    super.initState();
    obtenerLista = getRatesR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          //Image.asset('assets/img/logo_sub_principal.png')
        ],
        //leading: ,
      ),
      body: Container(
        child: FutureBuilder(
          future: obtenerLista,
          builder: (BuildContext context,
              AsyncSnapshot<List<RatesListServer>> snapshot) {
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
  final List<RatesListServer> listElementos;

  const ListaElementos({Key key, this.listElementos}) : super(key: key);

  @override
  _ListaElementosState createState() => _ListaElementosState();
}

class _ListaElementosState extends State<ListaElementos> {
  List<RatesListServer> showListElement = [];

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
                              child: Center(child: Text(showListElement[index].costoT))),
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
