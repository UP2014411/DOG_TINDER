import 'package:dog_tinder/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../styles/app_style.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
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
      appBar: AppStyle.mainAppBar,
      body: Stack(
        children: <Widget>[
          Container(
            // App Background Colour
            color: AppStyle.backgroundColour,
          ),
          Center(
            child: Text(
              'Chat Page',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
