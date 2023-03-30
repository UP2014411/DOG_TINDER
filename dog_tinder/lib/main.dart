import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'styles/app_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Initializes the application
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder for Dogs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 5,
            backgroundColor: Color.fromARGB(255, 255, 60, 0),
            titleTextStyle: TextStyle(fontFamily: 'Rubik', fontSize: 20)),
      ),
      home: const HomeScreen(), // lib/screens/home_screen.dart
    );
  }
}
