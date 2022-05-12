import 'package:flutter/material.dart';

import '../Authencitation/login/view/screen/LoginPage.dart';

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      'Onay Kodu Ekranı',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Image.network(
                  r'''https://i.ibb.co/PFg37PZ/onaylama-kodu-vector.png''',
                  width: double.maxFinite,
                  height: 150,
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
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: ElevatedButton(
                      child: const Text('ONAY KODU GÖNDER'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Onay koduma erişemiyorum',),
                ),
              ],
            )),
      ],
    );
  }
}