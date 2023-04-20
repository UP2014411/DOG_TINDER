import 'package:flutter/material.dart';

import '../styles/app_style.dart';
import '../widgets/bottom_nav_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
              'Account Page',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
