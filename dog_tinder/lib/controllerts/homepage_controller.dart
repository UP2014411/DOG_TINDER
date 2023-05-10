import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_tinder/models/mylike_model.dart';
import 'package:dog_tinder/models/notifcation_model.dart';
import 'package:dog_tinder/models/signup_model.dart';
import 'package:dog_tinder/staticdata.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class HomePagController extends GetxController {
  static HomePagController get to => Get.find();
  List<UserSignUpModel> allUserlist = [];
  List<UserSignUpModel> searchlist = [];
  List<NotifcationModel> notifcationList = [];
  List<MyLikes> allMylikes = [];

  Future<List<UserSignUpModel>> getUserListMethod() async {
    allUserlist.clear();
    searchlist.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("id", isNotEqualTo: StaticData.userId)
        .get();

    querySnapshot.docs.forEach((doc) {
      allUserlist
          .add(UserSignUpModel.fromMap(doc.data() as Map<String, dynamic>));
    });
    searchlist = allUserlist;
    update();

    return allUserlist;
  }

  Future<List<NotifcationModel>> getUserNotifcationListMethod() async {
    print("enter to get notifcation");
    notifcationList.clear();

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("requests")
        .where("recipientID", isEqualTo: StaticData.userId)
        .where("status", isEqualTo: "pendding")
        .get();

    querySnapshot.docs.forEach((doc) {
      notifcationList
          .add(NotifcationModel.fromMap(doc.data() as Map<String, dynamic>));
    });
    print(notifcationList.length);
    update();

    return notifcationList;
  }

  updateNoticationStatus(NotifcationModel model, String status) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('requests').doc(model.userID).update({
      "status": status,
    });
    getUserNotifcationListMethod();
    addLikeUser(model);
  }

  addLikeUser(NotifcationModel notifcationModel) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    var uuid = Uuid();
    String id = uuid.v4();
    MyLikes model = MyLikes(
        id: id,
        userEmail: StaticData.userModel!.email,
        userID: StaticData.userId,
        recipentID: notifcationModel.userID,
        userImage: StaticData.userModel!.images![0],
        userName: StaticData.userModel!.name);
    await firestore.collection("myLikes").doc(id).set(model.toMap());

    var uid = Uuid();
    String likeid = uid.v4();
    MyLikes model1 = MyLikes(
        id: likeid,
        userEmail: notifcationModel.email,
        userID: notifcationModel.userID,
        recipentID: StaticData.userId,
        userImage: notifcationModel.userPic,
        userName: notifcationModel.userName);
    await firestore.collection("myLikes").doc(likeid).set(model1.toMap());
  }

  Future<List<MyLikes>> getMylikesListMethod() async {
    print(StaticData.userId);
    allMylikes.clear();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection("myLikes")
        .where("recipentID", isEqualTo: StaticData.userModel!.id)
        .get();

    querySnapshot.docs.forEach((doc) {
      allMylikes.add(MyLikes.fromMap(doc.data() as Map<String, dynamic>));
    });
    print(allMylikes.length);
    update();

    return allMylikes;
  }

  getUserProfile() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: StaticData.userId)
        .get();

    UserSignUpModel model = UserSignUpModel.fromMap(
        querySnapshot.docs[0].data() as Map<String, dynamic>);
    StaticData.userModel = model;

    update();
  }

  sendNotifcation() {}
  removeItem(UserSignUpModel model) {
    allUserlist.remove(model);
    update();
  }

  void addDataToSearchList(List<UserSignUpModel> results) {
    searchlist = results;
    update();
  }
}
