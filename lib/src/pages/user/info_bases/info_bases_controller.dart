import 'package:cherche_ultimo/src/pages/user/info_bases/models/base_model.dart';
import 'package:cherche_ultimo/src/pages/user/info_bases/repositories/info_base_repository.dart';
import 'package:flutter/cupertino.dart';

class InfoBaseController extends ChangeNotifier {
  InfoBaseRepository infoBaseRepository = InfoBaseRepository();
  List<TipoBase> baseList = [];
  bool loading = false;

  void init() async {
    loading = true;
    notifyListeners();
    baseList = await infoBaseRepository.getBaseList();
    loading = false;
    notifyListeners();
  }
}
