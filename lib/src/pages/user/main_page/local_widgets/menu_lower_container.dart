import 'package:cherche_ultimo/src/pages/user/main_page/main_user_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';



class ShowMainLowerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainUserController _mainUserController = MainUserController();
    return CurvedNavigationBar(

          //key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.house_outlined , size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.airport_shuttle_outlined, size: 30),
          ],
          color: Colors.grey[400],
          buttonBackgroundColor: Colors.grey[400],
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            _mainUserController.nomUsuario(context: context, index: index);
          },
          letIndexChange: (index) => true,

        );

  }
}
