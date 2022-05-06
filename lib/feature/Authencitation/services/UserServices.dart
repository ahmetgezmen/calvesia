import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/RegisteredModel.dart';
import '../models/UserModel.dart';

class UserServices {
  static Future<void> addUser(uuid, emailAddress, password) {
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('users').doc(uuid);
    return users
        .set(
            jsonDecode(userToJson(UserModel(
              isApproved: false,
              isAktive: true,
              email: emailAddress,
              password: password,
              uuid: uuid,
              registered: Registered(
                date: Timestamp.now().toDate().toString(),
              ),
            ))),
            SetOptions(
              merge: true,
            ))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static getUserInfoServices(uid) async {
    final _userDataRef =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    UserModel _userModel = UserModel.fromJson(_userDataRef);
    return _userModel;
  }

  static updateMyInfoServices(UserModel userModel) async {
    final db = await FirebaseFirestore.instance;
    final _userDataRef = await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef.update(jsonDecode(userToJson(userModel)));
  }

  static updateMyPhotoServices(photo) async {
    final db = await FirebaseFirestore.instance;
    final _userDataRef = await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef
        .update({"profileImage": photo})
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}
