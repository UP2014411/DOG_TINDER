import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:dog_tinder/screens/login_screen.dart';
import 'package:dog_tinder/widgets/flushbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();
  bool isgender = false;
  bool isFemail = false;
  String? useremail;
  String? userpassword;
  String? usergender;
  String? userage;
  List<String> userimages = [];
  String? userbio;
  String? userbreed;
  String? username;
  String? userlocation;
  final imagepicker = ImagePicker();
  List<XFile> image = [];
  List<String> imageUrls = [];

  addEmailAndPass(String email, String pass) {
    useremail = email;
    userpassword = pass;
    update();
  }

  clearList() {
    image.clear();
    imageUrls.clear();
    update();
  }

  addAge(String age) {
    userage = age;
    update();
  }

  addBioandBreedd(String bio, String breed) {
    userbio = bio;
    userbreed = breed;
    update();
  }

  addNameandlocation(String name, String location) {
    username = name;
    userlocation = location;
    update();
  }

  changeGender(int i) {
    if (i == 0) {
      usergender = "Male";
    } else {
      usergender = "Female";
    }
    update();
  }

  /// Get from gallery
  Future<List<XFile>> getFromGallery(BuildContext context) async {
    final List<XFile> pickedFile = await imagepicker.pickMultiImage();

    if (pickedFile != null) {
      image.addAll(pickedFile);
    } else {
      // ignore: use_build_context_synchronously
      MyFlushBar.showSimpleFlushBar(
          "select image", context, Colors.red, Colors.white);
    }
    update();
    return image;
  }

  // post image on firebase
  Future postImage(XFile? imagefile) async {
    String urls;
    Reference ref =
        FirebaseStorage.instance.ref().child('/image').child(imagefile!.name);
    await ref.putData(
        await imagefile.readAsBytes(),
        SettableMetadata(
          contentType: "image/jpeg",
        ));
    urls = await ref.getDownloadURL();
    return urls;
  }

  uploadImage(List<XFile> imageList) async {
    for (var images in imageList) {
      await postImage(images).then((downloadUrl) => imageUrls.add(downloadUrl));
    }
    update();
  }

  changeMaleValue(bool v) {
    isgender = v;
    if (v == true) {
      changeGender(0);
    }
    update();
  }

  changeFemaleValue(bool v) {
    isFemail = v;
    if (v == true) {
      changeGender(1);
    }
    update();
  }

  signUPUser(BuildContext context) async {
    var uuid = Uuid();
    String userId = uuid.v4();

    UserSignUpModel model = UserSignUpModel(
        age: userage,
        bio: userbio,
        breed: userbreed,
        email: useremail,
        gender: usergender,
        id: userId,
        images: imageUrls,
        location: userlocation,
        name: username,
        password: userpassword);

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("users")
        .doc(model.id)
        .set(model.toMap());
    MyFlushBar.showSimpleFlushBar(
        'Inserted Successfully', context, Colors.green, Colors.white);
    clearList();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }
}
