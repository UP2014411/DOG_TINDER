import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  /// App Main Colours Styling
  static Color backgroundColour = const Color.fromARGB(255, 255, 235, 238);
  static Color notifcationColour = const Color.fromARGB(255, 255, 158, 128);
  static Color selectedItemColour = const Color.fromARGB(255, 255, 143, 0);

  /// Text Styling
  static TextStyle profileCardName = GoogleFonts.nunito(
      fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);

  /// AppBar styling
  static AppBar appBar = AppBar(
      title: Text('Dog Tinder', style: AppStyle.appBarStyle),
      leading: AppStyle.appBarIcon);

  static TextStyle appBarStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

  static Icon appBarIcon =
      Icon(Icons.local_fire_department_rounded, // Tinder Icon
          color: Colors.black,
          size: 36);

  /// Widget Styling
}
