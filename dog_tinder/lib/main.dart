import 'package:dog_tinder/screens/home_screen.dart';
import 'package:dog_tinder/widgets/bottom_nav_bar.dart';
import 'package:dog_tinder/widgets/card_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
          title: 'Dog Tinder',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                // elevation: 5,
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
          home: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
