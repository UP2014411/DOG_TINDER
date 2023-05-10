import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_tinder/models/notifcation_model.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

/// Code that makes the swiping possible

enum CardStatus { like, dislike }

class CardProvider extends GetxController {
  static CardProvider get to => Get.find();
  List<String> _urlImages = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImages => _urlImages;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    update();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    update();
  }

  void endPosition() {
    _isDragging = false;
    update();

    final status = getStatus(force: true);

    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split('.').last.toUpperCase(),
        fontSize: 36,
      );
    }

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      default:
        resetPosition();
    }

    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    update();
  }

  double getStatusOpacity() {
    // Opacity for like and dislike stamps
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos / delta;

    return min(opacity, 1);
  }

  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;

    if (force) {
      final delta = 100;

      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      }
    } else {
      final delta = 20;

      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      }
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    update();
  }

  void dislike() {
    _angle = -28;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    update();
  }

  Future _nextCard() async {
    if (_urlImages.isEmpty) return;

    await Future.delayed(
        Duration(milliseconds: 200)); // Waits till animation is finished
    _urlImages.removeLast(); // Removes swiped image from stack
    resetPosition();
  }

  sendnotifcation(String id) async {
    var uuid = Uuid();
    String notifcationId = uuid.v4();
    NotifcationModel model = NotifcationModel(
        email: StaticData.userModel!.email,
        recipientID: id,
        status: "pendding",
        userID: StaticData.userModel!.id,
        userName: StaticData.userModel!.name,
        id: notifcationId,
        userPic: StaticData.userModel!.images![0]);

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("requests")
        .doc(StaticData.userModel!.id)
        .set(model.toMap());
  }
}
