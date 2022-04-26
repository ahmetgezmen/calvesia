import 'package:flutter/material.dart';

import '../../feature/onboard/HomePage.dart';

class MyApp extends StatefulWidget {
  final bool isInitialialized;
  MyApp({Key? key, required this.isInitialialized}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isInitialialized != widget.isInitialialized)
    {
      setState(() {});
    }

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget.isInitialialized ? HomePage() : CircularProgressIndicator(),
    );
  }
}


