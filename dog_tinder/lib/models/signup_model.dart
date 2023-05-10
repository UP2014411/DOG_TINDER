import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserSignUpModel {
  String? email;
  String? password;
  String? gender;
  String? age;
  List<dynamic>? images;
  String? bio;
  String? breed;
  String? name;
  String? location;
  String? id;
  UserSignUpModel({
    this.email,
    this.password,
    this.gender,
    this.age,
    this.images,
    this.bio,
    this.breed,
    this.name,
    this.location,
    this.id,
  });

  UserSignUpModel copyWith({
    String? email,
    String? password,
    String? gender,
    String? age,
    List<dynamic>? images,
    String? bio,
    String? breed,
    String? name,
    String? location,
    String? id,
  }) {
    return UserSignUpModel(
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      images: images ?? this.images,
      bio: bio ?? this.bio,
      breed: breed ?? this.breed,
      name: name ?? this.name,
      location: location ?? this.location,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
      'images': images,
      'bio': bio,
      'breed': breed,
      'name': name,
      'location': location,
      'id': id,
    };
  }

  factory UserSignUpModel.fromMap(Map<String, dynamic> map) {
    return UserSignUpModel(
      email: map['email'],
      password: map['password'],
      gender: map['gender'],
      age: map['age'],
      bio: map['bio'],
      breed: map['breed'],
      name: map['name'],
      images: List<dynamic>.from(map['images']),
      location: map['location'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSignUpModel.fromJson(String source) =>
      UserSignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserSignUpModel(email: $email, password: $password, gender: $gender, age: $age, images: $images, bio: $bio, breed: $breed, name: $name, location: $location, id: $id)';
  }

  @override
  bool operator ==(covariant UserSignUpModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.gender == gender &&
        other.age == age &&
        listEquals(other.images, images) &&
        other.bio == bio &&
        other.breed == breed &&
        other.name == name &&
        other.location == location &&
        other.id == id;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        images.hashCode ^
        bio.hashCode ^
        breed.hashCode ^
        name.hashCode ^
        location.hashCode ^
        id.hashCode;
  }
}
