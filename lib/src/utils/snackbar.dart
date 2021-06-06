import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Snackbar {
  static void showSnackbar(
      BuildContext context, GlobalKey<ScaffoldState> key, String text) {

    if(context == null) return;
    if(key == null) return;
    if(key.currentState ==null) return;
    
    FocusScope.of(context).requestFocus(FocusNode());

    key.currentState?.removeCurrentSnackBar();

    key.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign:  TextAlign.center,
        style:  TextStyle(
          color: Colors.white,
          fontSize: 14
        ),
      ),
      backgroundColor: Colors.blue[600],
      duration: Duration(seconds: 5)
    ));

    }
  }

