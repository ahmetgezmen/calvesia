import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:flutter/material.dart';

import '../../../viewmodel/user_view_model.dart';
import '../widget/email_alredy_use_widget.dart';

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
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/backgroundLogin.png").image,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(BaseColorPalet.onBoardButtonColor),
                          ),
                          child: const Text('KAYIT OL'),
                          onPressed: () async {
                            final result = await emailEduTagChecker(emailController.text);
                            if (result == true) {
                              await UserServices.SignUp(
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
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
