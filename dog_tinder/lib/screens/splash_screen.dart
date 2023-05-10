import 'package:dog_tinder/Home/dashboard.dart';
import 'package:dog_tinder/controllerts/card_provider.dart';
import 'package:dog_tinder/controllerts/homepage_controller.dart';
import 'package:dog_tinder/controllerts/signup_controller.dart';
import 'package:dog_tinder/helpers/sizes.dart';
import 'package:dog_tinder/screens/login_screen.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_app_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getDataFromSF();
    Get.put(SignupController());
    Get.put(HomePagController());
    Get.put(CardProvider());
    super.initState();
  }

  getDataFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userid = prefs.getString('UserId');

    if (userid == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    } else {
      StaticData.userId = userid;
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height(context) * 0.0005),
          child: const CustomAppBar(
            titleText: '',
            hasActions: false,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/svgs/logo.png',
                height: height(context) * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
