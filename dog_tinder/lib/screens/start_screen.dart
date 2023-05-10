import 'package:dog_tinder/helpers/sizes.dart';
import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final TabController tabController;

  const StartScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width(context) * 0.2),
              child: Column(
                children: [
                  SizedBox(
                      height: width(context) * 0.5,
                      width: width(context) * 0.6,
                      child: Image.asset(
                        'assets/images/dogs_start_screen.png',
                      )),
                  SizedBox(
                    height: height(context) * 0.01,
                  ),
                  Text(
                    'Welcome to Tinder for Dogs',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                        color: kBlueMainColorOne,
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        fontSize: 35.sp),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Text(
                    '',
                    style: GoogleFonts.lora(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 13.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width(context) * 0.01),
                gradient: const LinearGradient(
                  colors: [
                    kBlueMainColorOne,
                    kBlueMainColorOne,
                  ],
                ),
              ),
              child: SizedBox(
                width: width(context) * 0.8,
                height: height(context) * 0.05,
                child: ElevatedButton(
                  onPressed: () async {
                    tabController.animateTo(tabController.index + 1);

                    //context.read<OnBoardingBloc>().add(StartOnBoarding(pet: pet));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "START",
                        style: GoogleFonts.lora(
                            color: kColorWhite,
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
