import 'package:flutter/material.dart';
import '/styles/app_style.dart';
import '/widgets/bottom_nav_bar.dart';

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
            title: Text(
              'Dog Tinder',
              style: AppStyle.appBarStyle,
            ),
            // App Icon
            leading: AppStyle.appIcon),

        /// App Background
        body: Stack(
          children: <Widget>[
            Container(
              // App Background Colour
              color: AppStyle.backgroundColour,
            ),
          ],
        ),

        /// Bottom Nav bar
        bottomNavigationBar: const BottomNavBar());
  }
}
