import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/loading_widget.dart';
import '../../widget/something_wrong.dart';
import '../login/view/widget/login_successful_widget.dart';
import '../login/view/widget/user_note_found_widget.dart';
import '../login/view/widget/wrong_password_or_username_widget.dart';
import '../models/dob_model.dart';
import '../models/location_model.dart';
import '../models/registered_model.dart';
import '../models/schools_model.dart';
import '../models/user_model.dart';
import '../signup/view/widget/email_alredy_use_widget.dart';
import '../signup/view/widget/password_too_weak_widget.dart';
import '../signup/view/widget/sign_up_successful_widget.dart';

class UserServices {
  static login(BuildContext context, emailAddress, password) async {
    loadingWidgetButton(context);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).pop();
      await loginSuccessfulWidgetFunction(context);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        userNoteFoundWidgetFunction(context);
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        wrongPasswordOrUsernameWidgetFunction(context);
      }
    }
  }

  static signUp(BuildContext context, emailAddress, password, userName) async {
    loadingWidgetButton(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final uuid = FirebaseAuth.instance.currentUser!.uid;

      UserServices.addUser(
          uuid,
          emailAddress,
          password,
          userName,
        context
      );
      Navigator.of(context).pop();
      await signUpSuccessfulWidgetFunction(context);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        passwordTooWeakWidgetFunction(context);
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        emailAlredyUseWidgetFunction(context);
      }
    } catch (e) {
      Navigator.of(context).pop();
      somethingWrongWidgetFunction(context);
    }
  }

  static Future<void> addUser(uuid, emailAddress, password, username, context) {
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('users').doc(uuid);
    return users
        .set(
            jsonDecode(userToJson(UserModel(
              postUidList: [],
              favList: [],
                dob: Dob(),
              location: Location(),
              schools: Schools(),
              username:username ,
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
        .catchError((error) {
      somethingWrongWidgetFunction(context);
    });
  }

  static Future<UserModel> getUserInfoServices(uid) async {
    final _userDataRef = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    UserModel _userModel = UserModel.fromJson(_userDataRef.data());
    return _userModel;
  }
  static Future<List<String>?> getUserFavListServices() async {
    final _userDataRef = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    UserModel _userModel = UserModel.fromJson(_userDataRef.data());
    return _userModel.favList as List<String>;
  }

  static updateMyInfoServices(UserModel userModel) {
    final db = FirebaseFirestore.instance;
    final _userDataRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef.update(jsonDecode(userToJson(userModel)));
  }

  static updateMyPhotoServices(photo) async {
    final db = FirebaseFirestore.instance;
    final _userDataRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef
        .update({"profileImage": photo})
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
  static updateFavListServices(postList) async {
    final db = FirebaseFirestore.instance;
    final _userDataRef = db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef
        .update({"favList": postList})
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }


  static Future<String> _getImagePath(uid)async{
    UserModel user = await UserServices.getUserInfoServices(uid);
    return user.profileImage.toString();
  }

  static putProfilePhotosInCamera() async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("ppics");
    final uid =FirebaseAuth.instance.currentUser!.uid;

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (xFile == null){
      return;
    }else {
      final imagePath = xFile.path;
      await ppicsRef.child('$uid.jpg').putFile(File(imagePath));
      final result = updateMyPhotoServices(ppicsRef.child('$uid.jpg').fullPath);
      if (result==true){
        return true;
      }else{
        return false;
      }
    }
  }

  static putProfilePhotosInGallery() async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("ppics");
    final uid =FirebaseAuth.instance.currentUser!.uid;

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null){
      return;
    }else {
      final imagePath = xFile.path;
      await ppicsRef.child('$uid.jpg').putFile(File(imagePath));
      bool result = updateMyPhotoServices(ppicsRef.child('$uid.jpg').fullPath);
      return result;
    }
  }


  static Future<Uint8List?> getProfilePhotos(uid)async{
    final path = await _getImagePath(uid);
    Uint8List? uint8List = await FirebaseStorage.instance.ref(path).getData();
    return uint8List;
  }
}
