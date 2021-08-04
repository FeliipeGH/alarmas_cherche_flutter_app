import 'package:cherche_ultimo/main.dart';
import 'package:cherche_ultimo/src/const_global/const_global.dart';
import 'package:cherche_ultimo/src/pages/user/recordatorios/models/Remind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordatorioUserController extends ChangeNotifier {
  bool loading = false;
  List<Remind> remindList = [];

  initController() async {
    remindList.clear();
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 400));
    List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    await initRemindList(pendingNotificationRequests);
    loading = false;
    notifyListeners();
  }

  initRemindList(
      List<PendingNotificationRequest> pendingNotificationRequests) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (pendingNotificationRequests != null) {
      for (int i = 0; i < pendingNotificationRequests.length; i++) {
        String stringRemind = sharedPreferences
            .getString("$REMIND${pendingNotificationRequests[i].id}");
        Remind remind = remindFromJson(stringRemind);
        remindList.add(remind);
      }
    }
  }

  deleteRemind(int remindId) async {
    await flutterLocalNotificationsPlugin.cancel(remindId);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("$REMIND$remindId");
    initController();
  }
}
