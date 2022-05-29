import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:calvesia/feature/provider/base_provider.dart';
import 'package:calvesia/feature/provider/explore_page_provider.dart';
import 'package:calvesia/feature/provider/header_provider.dart';
import 'package:calvesia/feature/provider/post_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../config/thema.dart';
import '../../feature/onboard/on_board_page.dart';
import '../../feature/pages/base_page.dart';
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
        ChangeNotifierProvider(create: (_) => PostShareProvider()),
        ChangeNotifierProvider(create: (_) => HeaderProvider()),
        ChangeNotifierProvider(create: (_) => PostIsSharingProvider()),
        ChangeNotifierProvider(create: (_) => UserVievModel()),
        ChangeNotifierProvider(create: (_) => ExploreProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: BASEThemeData(),
        home: FirebaseAuth.instance.currentUser != null
            ? const BasePageMiddleWave()
            : const OnboardingPage(),
      ),
    );
  }
}
