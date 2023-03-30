import 'package:flutter/material.dart';
import '/styles/app_style.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        // Account Icon
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), label: 'Account'),
        // Chat Bubble Icon
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
        // Search Icon
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
      ],
    );
  }
}
