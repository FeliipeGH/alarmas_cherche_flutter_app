import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/models/puntos_resul.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_paradas/repositories/info_base_recorridos_repository.dart';
import 'package:flutter/cupertino.dart';

class InfoBaseParadasController extends ChangeNotifier {
  InfoBaseParadasRepository infoBaseRepository = InfoBaseParadasRepository();

  List<PuntosResul> list = [];
  bool loading = false;

  void init(String tipoRecor) async {
    loading = true;
    notifyListeners();
    list = await infoBaseRepository.getList(tipoRecor);
    loading = false;
    notifyListeners();
  }
}
