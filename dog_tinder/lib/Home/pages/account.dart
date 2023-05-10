import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:dog_tinder/screens/login_screen.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:dog_tinder/widgets/pet_image.dart';
import 'package:dog_tinder/widgets/title_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              width: width,
              alignment: Alignment.bottomLeft,
              child: Text(
                'Profile',
                style: GoogleFonts.lora(
                  fontSize: 20.sp,
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PetImage.medium(
              url: StaticData.userModel!.images![0],
              child: Container(
                height: height * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      StaticData.userModel!.name!,
                      style: GoogleFonts.lora(
                        fontSize: 17.sp,
                        color: kColorWhite,
                        textStyle: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWithIcon(title: 'Biography', iconData: Icons.edit),
                  Text(
                    StaticData.userModel!.bio!,
                    style: GoogleFonts.lora(
                      fontSize: 10.sp,
                      color: kColorBlack,
                      textStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const TitleWithIcon(title: 'Pictures', iconData: Icons.edit),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: StaticData.userModel!.images!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: PetImage.small(
                              width: 100,
                              url: StaticData.userModel!.images![index],
                            ),
                          );
                        }),
                  ),
                  const TitleWithIcon(title: 'Location', iconData: Icons.edit),
                  Text(StaticData.userModel!.location!,
                      style: GoogleFonts.lora(
                        fontSize: 10.sp,
                        color: kColorBlack,
                        textStyle: Theme.of(context).textTheme.subtitle2,
                      )),
                  const TitleWithIcon(title: 'Breed', iconData: Icons.edit),
                  Text(StaticData.userModel!.breed!,
                      style: GoogleFonts.lora(
                        fontSize: 10.sp,
                        color: kColorBlack,
                        textStyle: Theme.of(context).textTheme.subtitle2,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.8,
                        height: height * 0.05,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kBlueMainColorOne),
                            ),
                            onPressed: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.clear();
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (Route<dynamic> route) => false);
                              });
                            },
                            child: Text(
                              'Sign Out',
                              style: GoogleFonts.lora(
                                color: kColorWhite,
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
