import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_tinder/Home/dashboard.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:dog_tinder/widgets/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  getUserProfile(String email, String pass, BuildContext context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: pass)
        .get();

    if (querySnapshot.docs.isEmpty) {
      MyFlushBar.showSimpleFlushBar(
          "No Account Found", context, Colors.red, Colors.white);
    } else {
      UserSignUpModel model = UserSignUpModel.fromMap(
          querySnapshot.docs[0].data() as Map<String, dynamic>);
      StaticData.userModel = model;
      saveDataToSharedPref(model.id!);
      MyFlushBar.showSimpleFlushBar(
          "Login successfully", context, Colors.green, Colors.white);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));
      });
    }
  }

  saveDataToSharedPref(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("UserId", userId);
    StaticData.userId = userId;
  }
}
