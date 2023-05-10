import 'package:dog_tinder/controllerts/signup_controller.dart';
import 'package:dog_tinder/helpers/sizes.dart';
import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:dog_tinder/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class DemographicsScreen extends StatefulWidget {
  final TabController tabController;

  const DemographicsScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<DemographicsScreen> createState() => _DemographicsScreenState();
}

class _DemographicsScreenState extends State<DemographicsScreen> {
  String? age;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (obj) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextHeader(text: 'What\'s Your Dog\'s Gender?'),
                CustomCheckbox(
                  text: 'MALE',
                  value: obj.isgender,
                  // value: state.pet.gender == 'Male',
                  onChanged: (bool? newValue) {
                    obj.changeMaleValue(newValue!);
                  },
                ),
                CustomCheckbox(
                  text: 'FEMALE',
                  value: obj.isFemail,
                  // value: state.pet.gender == 'Female',
                  onChanged: (bool? newValue) {
                    obj.changeFemaleValue(newValue!);
                  },
                ),
                SizedBox(height: height(context) * 0.002),
                const CustomTextHeader(text: 'What\'s Your Dog\'s Age?'),
                CustomTextField(
                  hint: 'ENTER YOUR DOG\'S AGE',
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 3,
                  selectedColor: Theme.of(context).primaryColorDark,
                  unselectedColor: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(height: 10),
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
                        if (age == null) {
                          MyFlushBar.showSimpleFlushBar("Fill All Fields",
                              context, Colors.red, Colors.white);
                        } else {
                          SignupController.to.addAge(age!);
                          widget.tabController
                              .animateTo(widget.tabController.index + 1);
                        }
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
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
