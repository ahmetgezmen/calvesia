import 'package:firebase_auth/firebase_auth.dart';

import '../view/widget/LoginSuccessfulWidget.dart';
import '../view/widget/UserNoteFoundWidget.dart';
import '../view/widget/WrongPasswordOrUsernameWidget.dart';

Login(emailAddress, password) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    return LoginSuccessfulWidget();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return UserNoteFoundWidget();
    } else if (e.code == 'wrong-password') {
      return WrongPasswordOrUsernameWidget();
    }
  }
}
