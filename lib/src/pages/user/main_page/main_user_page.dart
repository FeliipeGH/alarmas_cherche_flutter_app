import 'package:cherche_ultimo/src/pages/user/main_page/local_widgets/banner_app.dart';
import 'package:cherche_ultimo/src/pages/user/main_page/local_widgets/menu_lower_container.dart';
import 'package:cherche_ultimo/src/pages/user/main_page/local_widgets/menu_top_container.dart';

import 'package:flutter/material.dart';

class MainUserPage extends StatefulWidget {
  @override
  _MainUserPageState createState() => _MainUserPageState();
}

class _MainUserPageState extends State<MainUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //poner una cosa ensima de otra
          Stack(
            children: [
              BannerApp(),
              MenuTopContainer()
            ],
          ),
        ],
      ),
      bottomNavigationBar: ShowMainLowerContainer(),
    );
  }

}






