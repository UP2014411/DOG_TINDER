// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotifcationModel {
  String? userName;
  String? email;
  String? userID;
  String? userPic;
  String? recipientID;
  String? status;
  String? id;
  NotifcationModel({
    this.userName,
    this.email,
    this.userID,
    this.userPic,
    this.recipientID,
    this.status,
    this.id,
  });

  NotifcationModel copyWith({
    String? userName,
    String? email,
    String? userID,
    String? userPic,
    String? recipientID,
    String? status,
    String? id,
  }) {
    return NotifcationModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      userID: userID ?? this.userID,
      userPic: userPic ?? this.userPic,
      recipientID: recipientID ?? this.recipientID,
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'userID': userID,
      'userPic': userPic,
      'recipientID': recipientID,
      'status': status,
      'id': id,
    };
  }

  factory NotifcationModel.fromMap(Map<String, dynamic> map) {
    return NotifcationModel(
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      userPic: map['userPic'] != null ? map['userPic'] as String : null,
      recipientID:
          map['recipientID'] != null ? map['recipientID'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotifcationModel.fromJson(String source) =>
      NotifcationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotifcationModel(userName: $userName, email: $email, userID: $userID, userPic: $userPic, recipientID: $recipientID, status: $status, id: $id)';
  }

  @override
  bool operator ==(covariant NotifcationModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.email == email &&
        other.userID == userID &&
        other.userPic == userPic &&
        other.recipientID == recipientID &&
        other.status == status &&
        other.id == id;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        email.hashCode ^
        userID.hashCode ^
        userPic.hashCode ^
        recipientID.hashCode ^
        status.hashCode ^
        id.hashCode;
  }
}
