import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  /// App Main Colours Styling
  static Color backgroundColour = const Color.fromARGB(255, 255, 235, 238);
  static Color notifColour = const Color.fromARGB(255, 255, 158, 128);
  static Color selectedItemColour = const Color.fromARGB(255, 255, 143, 0);

  /// Text styling
  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w500);

  static TextStyle cardName = GoogleFonts.nunito(
      fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle appBarStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

  /// App Icon Styling
  static Icon appIcon = Icon(Icons.local_fire_department_rounded, // Tinder Icon
      color: Colors.black,
      size: 36);
}
