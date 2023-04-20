import 'package:flutter/material.dart';

import '../styles/app_style.dart';
import '../widgets/bottom_nav_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top App Bar
      appBar: AppStyle.appBar,
      body: Stack(
        children: <Widget>[
          Container(
            // App Background Colour
            color: AppStyle.backgroundColour,
          ),
          Center(
            child: Text(
              'Search Page',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
