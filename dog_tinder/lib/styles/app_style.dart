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

  /// Welcome Page AppBar styling
  static AppBar welcomeAppBar = AppBar(
    backgroundColor: const Color(0xfffd297b),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xfffd297b), Color(0xffff655b)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Text("Tinder for Dogs",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
      ),
    ),
  );

  /// Main AppBar styling
  static AppBar mainAppBar = AppBar(
      title: const Text(
        'Dog Tinder',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: AppStyle.appBarIcon);

  static TextStyle appBarStyle = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

  static Icon appBarIcon =
      const Icon(Icons.local_fire_department_rounded, // Tinder Icon
          color: Colors.black,
          size: 36);

  /// Widget Styling
}
