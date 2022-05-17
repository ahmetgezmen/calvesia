import 'package:flutter/material.dart';
import '../../config/thema.dart';
import '../../feature/pages/BasePage.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: BASEThemeData(),
      home: BasePage(),
    );
  }
}


