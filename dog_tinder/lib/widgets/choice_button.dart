import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final IconData iconData;
  final bool hasGradient;
  const ChoiceButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.size,
      required this.color,
      required this.iconData,
      required this.hasGradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(20),
          gradient: hasGradient
              ? LinearGradient(colors: [
                  Theme.of(context).primaryColor.withAlpha(200),
                  Theme.of(context).primaryColor.withRed(900),
                ])
              : const LinearGradient(colors: [kColorGrey, kColorGrey]),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 4,
                offset: Offset(1, 1),
                color: Colors.white)
          ]),
      child: Icon(
        iconData,
        size: size,
        color: color,
      ),
    );
  }
}
