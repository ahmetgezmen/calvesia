import 'package:firebase_core/firebase_core.dart';
import 'AppBase.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> geIinitializedMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(),
  );
}
