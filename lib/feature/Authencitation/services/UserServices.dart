import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  static updateMyInfoServices(UserModel userModel, uid) async {
    final db = await FirebaseFirestore.instance;
    final _userDataRef = await db.collection("users").doc(uid);
    db.runTransaction((transaction) async {
      // final snapshot = await transaction.get(_userDataRef);
      // final newPopulation = snapshot.get("population") + 1;
      transaction.update(_userDataRef, jsonDecode(userToJson(userModel)));
    }).then(
      (value) => true,
      onError: (e) =>
          // print("Error updating document $e")
          false,
    );
  }
}
