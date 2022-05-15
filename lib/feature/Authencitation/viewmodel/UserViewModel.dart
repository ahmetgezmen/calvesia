import 'dart:typed_data';

import 'package:calvesia/feature/Authencitation/models/UserModel.dart';
import 'package:calvesia/feature/widget/SometingWrong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widget/LoadingWidget.dart';
import '../login/view/widget/LoginSuccessfulWidget.dart';
import '../login/view/widget/UserNoteFoundWidget.dart';
import '../login/view/widget/WrongPasswordOrUsernameWidget.dart';
import '../services/UserServices.dart';
import '../signup/view/widget/EmailAlredyUseWidget.dart';
import '../signup/view/widget/PasswordTooWeakWidget.dart';
import '../signup/view/widget/SendMailWidget.dart';

class UserVievModel {
  static Login(BuildContext context, emailAddress, password) async {
    LoadingWidgetButton(context);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).pop();
      LoginSuccessfulWidgetFunction(context);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        UserNoteFoundWidgetFunction(context);
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        WrongPasswordOrUsernameWidgetFunction(context);
      }
    }
  }

  static SignUp(BuildContext context, emailAddress, password, userName) async {
    LoadingWidgetButton(context);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final uuid = FirebaseAuth.instance.currentUser!.uid;

      UserServices.addUser(
        uuid,
        emailAddress,
        password,
        userName
      );
      Navigator.of(context).pop();
      SendEmailWidgetFunction(context);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        PasswordTooWeakWidgetFunction(context);
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        EmailAlredyUseWidgetFunction(context);
      }
    } catch (e) {
      Navigator.of(context).pop();
      SometingWrongWidgetFunction(context);
    }
  }

  static Future<UserModel> get getMyInfo async =>await UserServices.getUserInfoServices(FirebaseAuth.instance.currentUser!.uid);
  static Future<Uint8List?> get getMyProfilePhoto async => await UserServices.getProfilePhotos(FirebaseAuth.instance.currentUser!.uid);

  static updateMyInfo(UserModel userModel){
    bool result = UserServices.updateMyInfoServices(userModel);
  }

}
