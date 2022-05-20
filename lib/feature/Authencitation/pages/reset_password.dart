import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/Style/ColorPalette.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                      child: const Text(
                        'Şifreni Sıfırla',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SvgPicture.asset("assets/images/LoginImage.svg",
                    width: double.maxFinite,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      obscureText: true,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Yeni şifren',
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
                        labelText: 'Şifreni Onayla',
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BaseColorPalet.onBoardButtonColor),
                        ),
                        child: const Text('ŞİFRENİ SIFIRLA'),
                        onPressed: () {
                          // TODO Sifre sifirla gorevi yapilacak
                        },
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
