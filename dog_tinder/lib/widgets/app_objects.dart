import 'package:dog_tinder/styles/app_style.dart';
import 'package:flutter/material.dart';

// Dog Tinder Logo
Widget appLogo() => Row(
      children: [
        AppStyle.appIcon,
        const SizedBox(width: 4),
        Text(
          'Dog Tinder',
          style: AppStyle.appBarStyle,
        ),
      ],
    );

// Buttons substituted for swiping
Widget matchButtons() => Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, // Aligns buttons correctly
      children: [
        // Swipe Left
        ElevatedButton(
          child: const Icon(Icons.clear, color: Colors.red, size: 43),
          onPressed: () {},
        ),
        // Swipe Right
        ElevatedButton(
          child: const Icon(Icons.favorite, color: Colors.teal, size: 43),
          onPressed: () {},
        ),
      ],
    );
