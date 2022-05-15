import 'package:flutter/material.dart';

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
                      padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                      child: const Text(
                        'Şifreni Sıfırla',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Image.network(
                    r'''https://i.ibb.co/YZY6hhQ/giris-yap-vector.png''',
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
                        child: const Text('ŞİFRENİ SIFIRLA'),
                        onPressed: () {
                          print(nameController.text);
                          print(passwordController.text);
                        },
                      )
                  ),
                ],
              )),
        ],
      ),
    );
  }
}