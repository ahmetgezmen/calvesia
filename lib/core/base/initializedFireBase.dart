import 'package:firebase_core/firebase_core.dart';
import '../../feature/onboard/HomePage.dart';
import 'AppBase.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

bool _isInitialialized = false;
Future<void> initializedMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _isInitialialized = true;

  runApp(
    MyApp(
      isInitialialized: _isInitialialized,
    ),
  );
}
