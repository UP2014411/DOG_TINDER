import 'package:dog_tinder/controllerts/signup_controller.dart';
import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../helpers/sizes.dart';
import '../widgets/custom_text_header.dart';

class PicturesScreen extends StatelessWidget {
  final TabController tabController;

  const PicturesScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 50,
      ),
      child: GetBuilder<SignupController>(builder: (obj) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextHeader(text: 'Add 2 or More Pictures'),
                const SizedBox(height: 10),
                Container(
                  height: 400,
                  child: obj.imageUrls.isEmpty
                      ? Center(
                          child: InkWell(
                            onTap: () {
                              obj.getFromGallery(context).then((value) {
                                obj.uploadImage(value);
                              });
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.image),
                                  Text("Select  images")
                                ],
                              ),
                            ),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.65,
                                  mainAxisSpacing: 5),
                          itemCount: obj.imageUrls.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width(context) * 0.02,
                                      vertical: width(context) * 0.0003),
                                  child: Container(
                                    height: 150,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        top: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        left: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        right: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                    ),
                                    child: Image.network(
                                      obj.imageUrls[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                          }),
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 4,
                  selectedColor: Theme.of(context).primaryColorDark,
                  unselectedColor: Theme.of(context).backgroundColor,
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
                        tabController.animateTo(tabController.index + 1);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
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
            )
          ],
        );
      }),
    );
  }
}
