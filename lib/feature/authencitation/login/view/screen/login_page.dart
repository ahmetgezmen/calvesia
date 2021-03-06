import 'package:calvesia/utils/style/color_palette.dart';
import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../pages/base_page.dart';
import '../../../pages/forgot_password.dart';
import '../../../signup/view/screen/sign_up_page.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
                      padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SvgPicture.asset("assets/images/LoginImage.svg",
                    width: double.maxFinite,
                    height: screenHeight / 5.2,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edu uzantili email Adresi',
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return const ForgotPasswordPage();
                          },));
                        },
                        child: const Text(
                          'Şifremi unuttum',
                          style: TextStyle(
                            color: BaseColorPalet.inAktiveButtonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: screenHeight / 15.62,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BaseColorPalet.main),
                        ),
                        child: const Text('GİRİŞ YAP'),
                        onPressed: () async {
                          final result = await UserServices.login(context,
                              nameController.text, passwordController.text);
                          if (result == true) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BasePageMiddleWave(),
                            ));
                          }
                        },
                      )),
                  Row(
                    children: <Widget>[
                      const Text('Hesabın yok mu ?'),
                      TextButton(
                        child: const Text(
                          'Kayıt ol',
                          style: TextStyle(fontSize: 20, color: BaseColorPalet.inAktiveButtonColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const  SingUpPAgeScreen(),
                          ));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
