import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Colors.grey,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.29,
        child: Row(
          //nos centra el contenido
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                'assets/img/logo_sub_principal.png',
                width: 350,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}