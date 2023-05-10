import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MyFlushBar {
  static showSimpleFlushBar(
      String message, BuildContext context, Color baccolor, Color textcolor) {
    return Flushbar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: textcolor),
      ),
      shouldIconPulse: true,
      backgroundColor: baccolor,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 1),
    )..show(context);
  }
}
