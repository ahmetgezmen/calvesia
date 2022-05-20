import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../config/thema.dart';
import '../../feature/onboard/OnBoardPage.dart';
import '../../feature/pages/BasePage.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseProvider()),
        ChangeNotifierProvider(create: (_) => HeaderProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: BASEThemeData(),
        home: FirebaseAuth.instance.currentUser != null
            ? BasePageMiddleWawe()
            : OnboardingPage(),
      ),
    );
  }
}
