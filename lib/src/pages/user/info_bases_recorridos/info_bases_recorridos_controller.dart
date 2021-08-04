import 'package:cherche_ultimo/src/pages/user/info_bases/models/base_model.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_recorridos/models/tipo_recorrido_result.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases_recorridos/repositories/info_base_recorridos_repository.dart';
import 'package:flutter/cupertino.dart';

class InfoBaseRecorridosController extends ChangeNotifier {
  InfoBaseRecorridosRepository infoBaseRepository =
      InfoBaseRecorridosRepository();
  bool firstBuild = true;

  List<TipRecorridoResul> recorridoList = [];
  bool loading = false;

  void init(TipoBase tipoBase) async {
    if (firstBuild) {
      loading = true;
      notifyListeners();
      recorridoList = await infoBaseRepository.getRecorridos(tipoBase.nombreBc);
      loading = false;
      notifyListeners();
      firstBuild = false;
    }
  }
}
