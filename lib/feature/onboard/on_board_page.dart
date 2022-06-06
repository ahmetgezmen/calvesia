import 'package:calvesia/Utils/Style/color_palette.dart';
import 'package:calvesia/feature/Authencitation/login/view/screen/login_page.dart';
import 'package:calvesia/feature/Authencitation/signup/view/screen/sign_up_page.dart';
import 'package:calvesia/feature/pages/base_page.dart';
import 'package:calvesia/feature/widget/something_wrong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(urlImage).image, fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 320),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xfff6f9ff),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xfff6f9ff),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 3);
            },
            children: [
              buildPage(
                  urlImage: "assets/images/ob_page_1.png",
                  title: "Etrafındaki Etkinlikleri Keşfet!",
                  subtitle:
                      "Üniversitelere özel etkinliklerden \n anında haberdar olabilir, \n İstersen sen de etkinlik oluşturabilirsin."),
              buildPage(
                  urlImage: "assets/images/ob_page_2.png",
                  title: "Tüm Etkinlikler Tek Sayfada!",
                  subtitle:
                      "Uygulama takviminden hangi gün \n hangi etkinliğin olduğunu gör  \n Etkinliklerini kendine özel takvimde düzenle"),
              buildPage(
                  urlImage: "assets/images/ob_page_3.png",
                  title: "Kampüs Bir Tıkla Yanında!",
                  subtitle:
                      "Sadece üniversite öğrencilerinin \n düzenlediği etkinliklerle kampüs heyecanı \n hep seninle olacak"),
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/images/ob_page_4.png").image,
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight / 7.1),
                    const Text(
                      "Younivent'e",
                      style: TextStyle(
                        color: Color(0xfff6f9ff),
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight / 32.54),
                    Container(
                      padding: const EdgeInsets.symmetric(),
                      child: const Text(
                        "Hoşgeldin",
                        style: TextStyle(color: Color(0xfff6f9ff), fontSize: 24),
                      ),
                    ),
                    SizedBox(height: screenHeight / 7.1),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0Xffffb85a)),
                              foregroundColor: MaterialStateProperty.all(
                                  const Color(0xfff6f9ff))),
                          child: const Text("GİRİŞ YAP"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const LoginPageScreen();
                              },
                            ));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.width * 0.14,
                        child: Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffc04757)),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color(0xfff6f9ff))),
                            child: const Text(
                              "KAYIT OL",
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const SingUpPAgeScreen();
                                },
                              ));
                            },
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: const Color(0xfff6f9ff),
                        textStyle: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signInAnonymously();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BasePageMiddleWave(),
                          ));
                        } on FirebaseAuthException catch (_) {
                          somethingWrongWidgetFunction(context);
                        }
                      },
                      child: const Text(
                        'Uygulamaya Göz At',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Align(
            child: isLastPage
                ? Container(
                    height: 0,
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: screenHeight / 9.76,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all( BaseColorPalet.onBoardButtonColor),
                          ),
                          child: const Text(
                            "Atla",
                            style: TextStyle(
                              color: Color(0xfff6f9ff),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => controller.jumpToPage(3),
                        ),
                        Center(
                          child: PageIndicator(controller: controller),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all( BaseColorPalet.onBoardButtonColor),
                          ),
                          child: const Text(
                            "İleri",
                            style: TextStyle(
                              color: Color(0xfff6f9ff),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                        ),
                      ],
                    ),
                  ),
            alignment: Alignment.bottomCenter,
          ))
        ],
      ),
    );
  }
}
