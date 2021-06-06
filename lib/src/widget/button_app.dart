
import 'package:flutter/material.dart';
import 'package:cherche_ultimo/src/utils/colorsP.dart' as utils;

class ButtonApp extends StatelessWidget {
  Color color;
  Color textColor;
  String text;
  IconData icon;
  Function onPressedP;
  ButtonApp({
    this.color=Colors.black,
    this.textColor=Colors.white,
    this.icon = Icons.arrow_forward_ios,
    this.onPressedP,
    @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressedP(
        );
      },
      color: utils.ColorsP.cloneColors,
      textColor: textColor,
      child: Stack(
          children:[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                alignment:  Alignment.center,
                  child: Text(text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  )
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(icon, color: Colors.black,),
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
