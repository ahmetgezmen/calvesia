import 'package:calvesia/feature/Authencitation/login/view/screen/LoginPage.dart';
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
          ],
        ),
      ),
    );
  }
}