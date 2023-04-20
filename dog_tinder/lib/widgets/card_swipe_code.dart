import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dog_tinder/widgets/card_provider.dart';

/// Code that makes the swiping possible

class CardSwipe extends StatefulWidget {
  // Gets the image url
  final String urlImage;
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

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.isFront
          ? profileFrontCard()
          : profileCard(), // Profile card of user
    );
  }

  Widget profileFrontCard() {
    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;

        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 180;
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
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.endPosition();
      },
    );
  }

  Widget profileCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Makes the card rounded
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3, 0),
          ),
        ),
      ),
    );
  }

  Widget cardStamps() {
    final provider = Provider.of<CardProvider>(context);
    final status =
        provider.getStatus(); // gets thr status of the card (like or dislike)
    final opacity = provider.getStatusOpacity();

    switch (status) {
      case CardStatus.like:
        final child = cardStamp(
            angle: -0.5, color: Colors.green, text: 'LIKE', opacity: opacity);

        return Positioned(top: 64, left: 50, child: child);
      case CardStatus.dislike:
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
