import '/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:dog_tinder/screens/chatUI.dart';
import 'package:dog_tinder/screens/home_screen.dart';
import 'package:dog_tinder/screens/accountScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _pageOptions[_selectedIndex]));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _onTap();
  }

  final _pageOptions = [
    HomeScreen(),
    Chatscreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // References what tab the user is on
      onTap: _onItemTapped, // Changes tab when clicked
      selectedItemColor: AppStyle.selectedItemColour,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        // Home Icon
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        // Chat Bubble Icon
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
        // Account Icon
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), label: 'Account'),
        // Search Icon
        // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
      ],
    );
  }
}
