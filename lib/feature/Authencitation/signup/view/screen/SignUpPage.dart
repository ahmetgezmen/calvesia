import 'package:flutter/material.dart';

import '../../../viewmodel/UserViewModel.dart';
import '../widget/EmailAlredyUseWidget.dart';

class SingUpPAgeScreen extends StatefulWidget {
  const SingUpPAgeScreen({Key? key}) : super(key: key);

  @override
  State<SingUpPAgeScreen> createState() => _SingUpPAgeScreenState();
}

class _SingUpPAgeScreenState extends State<SingUpPAgeScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  emailEduTagChecker(email) {
    final value = email.split("@");
    if (value[1] == "std.idu.edu.tr") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://i.ibb.co/rcR35LF/arkaplan.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 100, 10, 50),
                      child: const Text(
                        'Kayıt ol',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kullanıcı adı',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edu uzantılı e-mail Adresi',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '************',
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: ElevatedButton(
                        child: const Text('KAYIT OL'),
                        onPressed: () async {
                          final result = await emailEduTagChecker(emailController.text);
                          if (result == true) {
                            await UserVievModel.SignUp(
                                context,
                                emailController.text,
                                passwordController.text,
                                userNameController.text);
                            Navigator.of(context).pop();
                          } else {
                            EmailAlredyUseWidgetFunction(context);
                          }
                        },
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
