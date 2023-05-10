import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final bool hasActions;
  final String titleText;

  const CustomAppBar(
      {Key? key, this.hasActions = true, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: kColorWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: kColorWhite,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        titleText,
        style: GoogleFonts.lora(
          fontSize: 25.sp,
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actions: hasActions
          ? [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/matches');
                  },
                  icon: const Icon(
                    Icons.message,
                    color: kColorBlack,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: const Icon(Icons.person, color: kColorBlack))
            ]
          : null,
    );
  }
}
