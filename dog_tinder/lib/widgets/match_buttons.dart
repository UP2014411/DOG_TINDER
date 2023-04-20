import 'package:provider/provider.dart';
import 'package:dog_tinder/widgets/card_provider.dart';
import 'package:dog_tinder/widgets/tinder_card_design.dart';
import 'package:dog_tinder/user.dart';
import 'package:dog_tinder/styles/app_style.dart';
import 'package:flutter/material.dart';

/// Code for the buttons that can be used to match outside of swiping

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
                Expanded(child: TinderCard(user: user)),
                const SizedBox(height: 16),
                matchButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dog Tinder Logo
  Widget appLogo() {
    return Row(
      children: [
        AppStyle.appBarIcon,
        const SizedBox(width: 4),
        Text(
          'Dog Tinder',
          style: AppStyle.appBarStyle,
        ),
      ],
    );
  }

  // Buttons substituted for swiping
  Widget matchButtons() {
    final provider = Provider.of<CardProvider>(context);
    // final users = provider.users;
    final status = provider.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, // Aligns buttons correctly
      children: [
        // Swipe Left
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.red, Colors.white, isDislike),
            backgroundColor: getColor(Colors.white, Colors.red, isDislike),
            side: getBorder(Colors.red, Colors.white, isDislike),
          ),
          child: const Icon(Icons.clear, color: Colors.red, size: 43),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);

            provider.dislike();
          },
        ),
        // Swipe Right
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.teal, Colors.white, isLike),
            backgroundColor: getColor(Colors.white, Colors.teal, isLike),
            side: getBorder(Colors.teal, Colors.white, isLike),
          ),
          child: const Icon(Icons.favorite, color: Colors.teal, size: 43),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);

            provider.like();
          },
        ),
      ],
    );
  }

  MaterialStateProperty<Color> getColor(
      Color color, Color colorPressed, bool force) {
    final getColor = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(
      Color color, Color colorPressed, bool force) {
    final getBorder = (Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return BorderSide(color: Colors.transparent);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorder);
  }
}
