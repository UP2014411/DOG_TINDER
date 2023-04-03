import 'package:flutter/material.dart';
import 'package:dog_tinder/user.dart';
import 'package:dog_tinder/styles/app_style.dart';

class DogTinderCard extends StatefulWidget {
  // Gets the user information
  final User user;

  const DogTinderCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<DogTinderCard> createState() => _DogTinderCardState();
}

class _DogTinderCardState extends State<DogTinderCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Makes the card rounded on the edges
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.user.urlImage),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 0),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter, // Transparent colour starts here
            end: Alignment.bottomCenter, // Black colour starts here
            stops: [0.7, 1],
          )),
          child: Column(
            children: [
              const Spacer(),
              userName(),
              const SizedBox(height: 8),
              userStatus(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userName() => Row(
        children: [
          Text(
            widget.user.name,
            style: AppStyle.cardName,
          ),
          const SizedBox(width: 16),
          Text(
            '${widget.user.age}',
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget userStatus() => Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            width: 12,
            height: 12,
          ),
          const SizedBox(width: 8),
          const Text(
            'Recently Active',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      );
}
