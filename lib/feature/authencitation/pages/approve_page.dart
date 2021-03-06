import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Utils/Style/color_palette.dart';

class ApprovePage extends StatefulWidget {
  const ApprovePage({Key? key}) : super(key: key);

  @override
  State<ApprovePage> createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
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

    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:  Image.asset("assets/images/backgroundForgotPassword.png").image,
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
                        'Onay Kodu Ekranı',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SvgPicture.asset(
                    "assets/images/ApprovePage.svg",
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
                        labelText: 'Email Adresi',
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight / 15.62,
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(BaseColorPalet.onBoardButtonColor),
                        ),
                        child: const Text('ONAY KODU GÖNDER'),
                        onPressed: () {
                          // TODO Onay kodu gorevi yapilacak
                        },
                      )),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      'Onay koduma erişemiyorum',
                      style: TextStyle(
                        color: BaseColorPalet.inAktiveButtonColor
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
