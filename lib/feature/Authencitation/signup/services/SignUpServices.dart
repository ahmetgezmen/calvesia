import 'dart:convert';

import 'package:calvesia/feature/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/RegisteredModel.dart';
import '../../../widget/LoadingWidget.dart';
import '../view/widget/EmailAlredyUseWidget.dart';
import '../view/widget/PasswordTooWeakWidget.dart';
import '../view/widget/SendMailWidget.dart';
import '../../../models/UserModel.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser(UserModel user, uuid) {
  DocumentReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users').doc(uuid);
  return users
      .set(
          jsonDecode(userToJson(user)),
          SetOptions(
            merge: true,
          ))
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}


SignUp(BuildContext context, emailAddress, password) async {
  LoadingWidgetButton(context);
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    final uuid = FirebaseAuth.instance.currentUser!.uid;

    addUser(
        UserModel(
          isApproved: false,
          isAktive: true,
          email: emailAddress,
          password: password,
          uuid: uuid,
          registered: Registered(
            date: FieldValue.serverTimestamp().toString(),
          ),
        ),
        uuid);

    Navigator.of(context).pop();
    SendEmailWidgetFunction(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Navigator.of(context).pop();
      PasswordTooWeakWidgetFunction(context);
    } else if (e.code == 'email-already-in-use') {
      Navigator.of(context).pop();
      EmailAlredyUseWidgetFunction(context);
    }
  } catch (e) {
    // error widget yazilacak
  }
}
