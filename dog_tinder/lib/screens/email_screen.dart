import 'package:dog_tinder/controllerts/signup_controller.dart';
import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:dog_tinder/widgets/custom_text_field.dart';
import 'package:dog_tinder/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../helpers/sizes.dart';
import '../widgets/custom_text_header.dart';

class EmailScreen extends StatefulWidget {
  final TabController tabController;

  const EmailScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  String? email, pass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextHeader(
                text: 'What\'s Your Email Address?',
              ),
              CustomTextField(
                hint: 'ENTER YOUR EMAIL',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: height(context) * 0.002),
              const CustomTextHeader(text: 'What\'s Your Password?'),
              CustomTextField(
                obscure: true,
                hint: 'ENTER YOUR PASSWORD',
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
                selectedColor: Theme.of(context).primaryColorDark,
                unselectedColor: Theme.of(context).colorScheme.background,
              ),
              SizedBox(height: height(context) * 0.02),
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
                      if (email == null || pass == null) {
                        MyFlushBar.showSimpleFlushBar("Fill All Fields",
                            context, Colors.red, Colors.white);
                      } else {
                        SignupController.to.addEmailAndPass(email!, pass!);
                        widget.tabController
                            .animateTo(widget.tabController.index + 1);
                      }

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
                          "NEXT STEP",
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
