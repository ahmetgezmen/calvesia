import 'package:calvesia/feature/Authencitation/login/services/LoginServices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Center(child: const Text("hello")),
        child: Center(
          child: Login("ahmet-gezmen@hotmail.com", "password"),
        ),
      ),
    );
  }
}
