import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color beginColor;
  final Color endColor;
  final Color textColor;
  final Function()? onPressed;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.beginColor,
      required this.endColor,
      required this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: kGrayAppBarColor.withAlpha(120),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
          gradient: LinearGradient(colors: [beginColor, endColor])),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            fixedSize: const Size(100, 45),
          ),
          child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.lora(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      color: textColor),
                ),
              ))),
    );
  }
}
