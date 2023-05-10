import 'package:dog_tinder/controllerts/login_controller.dart';
import 'package:dog_tinder/helpers/values/colors.dart';
import 'package:dog_tinder/screens/onboarding_screen.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:dog_tinder/widgets/custom_elevated_button.dart';
import 'package:dog_tinder/widgets/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/sizes.dart';
import '../../../widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  String? email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.1),
        child: const CustomAppBar(
          titleText: 'Start',
          hasActions: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (v) {
                setState(() {
                  email = v;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (p) {
                setState(() {
                  pass = p;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton(
                    text: 'LOGIN',
                    beginColor: kBlueMainColorOne,
                    endColor: kBlueMainColorOne.withAlpha(1000),
                    textColor: kColorWhite,
                    onPressed: () {
                      if (email == null || pass == null) {
                        MyFlushBar.showSimpleFlushBar("Fill All Fields",
                            context, Colors.red, Colors.white);
                      } else {
                        LoginController.to
                            .getUserProfile(email!, pass!, context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(
                      text: 'SIGNUP',
                      beginColor: kBlueMainColorOne.withAlpha(1000),
                      endColor: kBlueMainColorOne,
                      textColor: kColorWhite,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnBoardingScreen(),
                            ));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
