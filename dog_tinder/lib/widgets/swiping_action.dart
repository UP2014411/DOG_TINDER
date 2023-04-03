import 'package:dog_tinder/widgets/tinder_card.dart';
import 'package:dog_tinder/widgets/app_objects.dart';
import 'package:dog_tinder/user.dart';
import 'package:dog_tinder/styles/app_style.dart';
import 'package:flutter/material.dart';

class SwipingCard extends StatefulWidget {
  const SwipingCard({super.key});

  @override
  State<SwipingCard> createState() => _SwipingCardState();
}

class _SwipingCardState extends State<SwipingCard> {
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
          ),
        ),
      ),
    );

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //       elevatedButtonTheme: ElevatedButtonThemeData(
    //           style: ElevatedButton.styleFrom(
    //     elevation: 8,
    //     backgroundColor: Colors.white,
    //     shape: const CircleBorder(),
    //     minimumSize: const Size.square(80),
    //   ))),
    //   home: );
  }
}
