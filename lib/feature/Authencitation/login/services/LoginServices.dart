import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../widget/LoadingWidget.dart';
import '../view/widget/LoginSuccessfulWidget.dart';
import '../view/widget/UserNoteFoundWidget.dart';
import '../view/widget/WrongPasswordOrUsernameWidget.dart';

Login(BuildContext context, emailAddress, password) async {
  LoadingWidgetButton(context);
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    Navigator.of(context).pop();
    LoginSuccessfulWidgetFunction(context);
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
