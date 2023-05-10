import 'dart:math';
import 'package:dog_tinder/Home/pet_details.dart';
import 'package:dog_tinder/controllerts/card_provider.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Code that makes the swiping possible

class CardSwipe extends StatefulWidget {
  // Gets the image url
  final UserSignUpModel urlImage;
  final bool isFront;

  const CardSwipe({
    Key? key,
    required this.urlImage,
    required this.isFront,
  }) : super(key: key);

  @override
  State<CardSwipe> createState() => _CardSwipeState();
}

class _CardSwipeState extends State<CardSwipe> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      CardProvider.to.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.urlImage);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetDetailsScreen(pet: widget.urlImage),
            ));
      },
      child: SizedBox.expand(
        child: widget.isFront
            ? profileFrontCard()
            : profileCard(), // Profile card of user
      ),
    );
  }

  Widget profileFrontCard() {
    return GetBuilder<CardProvider>(builder: (obj) {
      return GestureDetector(
        child: LayoutBuilder(builder: (context, constraints) {
          final position = obj.position;
          final milliseconds = obj.isDragging ? 0 : 400;

          final center = constraints.smallest.center(Offset.zero);
          final angle = obj.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: milliseconds),
            transform: rotatedMatrix..translate(position.dx, position.dy),
            child: Stack(
              children: [
                profileCard(),
                cardStamps(),
              ],
            ),
          );
        }),
        onPanStart: (details) {
          obj.startPosition(details);
        },
        onPanUpdate: (details) {
          obj.updatePosition(details);
        },
        onPanEnd: (details) {
          obj.endPosition();
        },
      );
    });
  }

  Widget profileCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Makes the card rounded
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.urlImage.images![0]),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3, 0),
          ),
        ),
      ),
    );
  }

  Widget cardStamps() {
    final status = CardProvider.to.getStatus();

    // gets thr status of the card (like or dislike)
    final opacity = CardProvider.to.getStatusOpacity();

    switch (status) {
      case CardStatus.like:
        Future.delayed(Duration(seconds: 1), () {
          CardProvider.to.sendnotifcation(widget.urlImage.id!);
          HomePagController.to.removeItem(widget.urlImage);
        });

        final child = cardStamp(
            angle: -0.5, color: Colors.green, text: 'LIKE', opacity: opacity);

        return Positioned(top: 64, left: 50, child: child);
      case CardStatus.dislike:
        Future.delayed(Duration(seconds: 1), () {
          HomePagController.to.removeItem(widget.urlImage);
        });
        final child = cardStamp(
            angle: 0.5, color: Colors.red, text: 'NOPE', opacity: opacity);

        return Positioned(top: 64, right: 50, child: child);
      default:
        return Container();
    }
  }

  Widget cardStamp({
    double angle = 0,
    required Color color,
    required String text,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
