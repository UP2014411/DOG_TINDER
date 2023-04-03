import 'package:dog_tinder/styles/app_style.dart';
import 'package:flutter/material.dart';

// Dog Tinder Logo
Widget appLogo() => Row(
      children: const [
        Icon(
          Icons.local_fire_department_rounded, // Tinder Icon
          color: Colors.white,
          size: 36,
        ),
        SizedBox(width: 4),
        Text(
          'Dog Tinder',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );

// Buttons substituted for swiping
Widget matchButtons() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          child: const Icon(Icons.clear, color: Colors.red, size: 4),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Icon(Icons.star, color: Colors.blue, size: 4),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Icon(Icons.favorite, color: Colors.teal, size: 4),
          onPressed: () {},
        ),
      ],
    );
