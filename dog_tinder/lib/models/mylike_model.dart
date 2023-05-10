// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyLikes {
  String? userName;
  String? userImage;
  String? userEmail;
  String? userID;
  String? recipentID;
  String? id;
  MyLikes({
    this.userName,
    this.userImage,
    this.userEmail,
    this.userID,
    this.recipentID,
    this.id,
  });

  MyLikes copyWith({
    String? userName,
    String? userImage,
    String? userEmail,
    String? userID,
    String? recipentID,
    String? id,
  }) {
    return MyLikes(
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      userEmail: userEmail ?? this.userEmail,
      userID: userID ?? this.userID,
      recipentID: recipentID ?? this.recipentID,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'userID': userID,
      'recipentID': recipentID,
      'id': id,
    };
  }

  factory MyLikes.fromMap(Map<String, dynamic> map) {
    return MyLikes(
      userName: map['userName'] != null ? map['userName'] as String : null,
      userImage: map['userImage'] != null ? map['userImage'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      recipentID:
          map['recipentID'] != null ? map['recipentID'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyLikes.fromJson(String source) =>
      MyLikes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyLikes(userName: $userName, userImage: $userImage, userEmail: $userEmail, userID: $userID, recipentID: $recipentID, id: $id)';
  }

  @override
  bool operator ==(covariant MyLikes other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.userImage == userImage &&
        other.userEmail == userEmail &&
        other.userID == userID &&
        other.recipentID == recipentID &&
        other.id == id;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        userImage.hashCode ^
        userEmail.hashCode ^
        userID.hashCode ^
        recipentID.hashCode ^
        id.hashCode;
  }
}
