import 'package:flutter/material.dart';
import '/styles/app_style.dart';
import '/widgets/bottom_nav_bar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Top App Bar
        appBar: AppBar(
          title: const Text(
            '🐶 Tinder for Dogs',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Rubik',
            ),
          ),
        ),

        // App Background
        body: Stack(
          children: <Widget>[
            Container(
              // App Background Colour
              color: AppStyle.backgroundColour,
            ),
          ],
        ),

        // Bottom Nav bar
        bottomNavigationBar: const BottomNavBar());
  }
}
