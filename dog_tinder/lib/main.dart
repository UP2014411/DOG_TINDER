import 'package:dog_tinder/widgets/swiping_action.dart';
import 'widgets/app_objects.dart';
import 'package:dog_tinder/user.dart';
import 'package:dog_tinder/widgets/tinder_card.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'styles/app_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Initializes the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      title: 'Dog Tinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 5,
            backgroundColor: Color.fromARGB(255, 255, 60, 0),
            titleTextStyle: TextStyle(fontSize: 20)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            // styling for the match buttons
            style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          minimumSize: const Size.square(80),
        )),
      ),
      home: const HomeScreen(), // lib/screens/home_screen.dart
    );
  }
}
