import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widget/LoadingWidget.dart';
import '../view/widget/EmailAlredyUseWidget.dart';
import '../view/widget/PasswordTooWeakWidget.dart';
import '../view/widget/SendMailWidget.dart';

SignUp(BuildContext context, emailAddress, password) async {
  LoadingWidgetButton(context);
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
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