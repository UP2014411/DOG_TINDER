import 'package:dog_tinder/widgets/swiping_card.dart';
import 'widgets/build_objects.dart';
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
  final user = const User(
      name: 'Steffi',
      age: 20,
      urlImage:
          'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade200, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              appLogo(),
              const SizedBox(height: 16),
              Expanded(child: DogTinderCard(user: user)),
              const SizedBox(height: 16),
              matchButtons(),
            ],
          ),
        )),
      ),
    );

    // MaterialApp(
    //   title: 'Tinder for Dogs',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     appBarTheme: const AppBarTheme(
    //         elevation: 5,
    //         backgroundColor: Color.fromARGB(255, 255, 60, 0),
    //         titleTextStyle: TextStyle(fontFamily: 'Rubik', fontSize: 20)),
    //   ),
    //   home: const HomeScreen(), // lib/screens/home_screen.dart
    // );
  }
}
