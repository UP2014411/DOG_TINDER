import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helpers/values/colors.dart';

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData iconData;

  const TitleWithIcon({Key? key, required this.title, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.lora(
              fontSize: 17.sp,
              color: kColorBlack,
              textStyle: Theme.of(context).textTheme.titleLarge,
            )),
        IconButton(onPressed: () {}, icon: Icon(iconData)),
      ],
    );
  }
}
