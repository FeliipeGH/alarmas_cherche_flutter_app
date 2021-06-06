import 'package:cherche_ultimo/src/pages/transport/main_transport_page/local_widgets/menu_lower_transport_container.dart';
import 'package:cherche_ultimo/src/pages/transport/main_transport_page/local_widgets/menu_top_transport_container.dart';
import 'package:cherche_ultimo/src/pages/user/main_page/local_widgets/banner_app.dart';

import 'package:flutter/material.dart';

class MainTransportPage extends StatefulWidget {
  @override
  _MainTransportPageState createState() => _MainTransportPageState();
}

class _MainTransportPageState extends State<MainTransportPage> {
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






