import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/RegisteredModel.dart';
import '../models/UserModel.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser(uuid, emailAddress, password) {
  DocumentReference<Map<String, dynamic>> users =
  FirebaseFirestore.instance.collection('users').doc(uuid);
  return users
      .set(
      jsonDecode(userToJson(
          UserModel(
            isApproved: false,
            isAktive: true,
            email: emailAddress,
            password: password,
            uuid: uuid,
            registered: Registered(
              date:  Timestamp.now().toDate().toString(),
            ),
          )

      )),
      SetOptions(
        merge: true,
      ))
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

