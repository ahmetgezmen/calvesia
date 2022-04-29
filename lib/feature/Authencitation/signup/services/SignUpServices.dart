


import 'package:firebase_auth/firebase_auth.dart';

SignUp(emailAddress, password) async {

  // LoadingWidget çalıştır


  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

  //  Burada üst widgetı kapa ve SendEmail çalıştır



  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}