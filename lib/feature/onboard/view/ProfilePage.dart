import 'package:flutter/material.dart';

import '../../Authencitation/signup/services/SignUpServices.dart';

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
            ElevatedButton(onPressed: () {
              SignUp(context, "ahmet-gezmen@hotmail.com", "password");
            }, child: Text("register"))
          ],
        ),
      ),
    );
  }
}
