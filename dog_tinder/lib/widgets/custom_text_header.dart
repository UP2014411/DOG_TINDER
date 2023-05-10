import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextHeader extends StatelessWidget {
  final String text;

  const CustomTextHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lora(
          textStyle: Theme.of(context).textTheme.headlineLarge,
          fontSize: 23.sp,
          color: kColorBlack),
    );
  }
}
