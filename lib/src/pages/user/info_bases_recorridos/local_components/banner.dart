import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BannerAppBases extends StatelessWidget {
  const BannerAppBases({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height * 0.18,
        child: Row(
          //nos centra el contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                'assets/img/logo_sub_principal.png',
                width: 300,
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerAppTitle extends StatelessWidget {
  const BannerAppTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Bases',
        style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
