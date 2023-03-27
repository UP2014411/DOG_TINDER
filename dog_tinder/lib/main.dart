import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder for Dogs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 5, // 0 to remove shadow
            backgroundColor: Color.fromARGB(255, 255, 60, 0),
            titleTextStyle: TextStyle(fontFamily: 'Rubik', fontSize: 20)),
      ),
      home: Scaffold(
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
              // App Background Image
              color: Colors.red[50],
            ),
          ],
        ),

        // Bottom Nav bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // References what tab the user is on
          onTap: _onItemTapped, // Changes tab when clicked
          selectedItemColor: Colors.amber[800],
          items: const <BottomNavigationBarItem>[
            // Home Icon
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // Chat Bubble Icon
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: 'Chat'),
            // Account Icon
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Account')
          ],
        ),
      ),
    );
  }
}
