import 'package:calvesia/feature/Authencitation/login/view/screen/LoginPage.dart';
import 'package:calvesia/feature/onboard/OnBoardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Authencitation/signup/view/screen/SignUpPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Profile Page"),
            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut() ;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingPage(),));
              }, child: Text("Cikis"))
          ],
        ),
      ),
    );
  }
}