import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../constant/app_constant.dart';
import 'app_base.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> geIinitializedMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  FirebaseDatabase.instance.databaseURL =
      "https://calvesia-default-rtdb.europe-west1.firebasedatabase.app";
  runApp(
    EasyLocalization(
      supportedLocales: AppConstant.SUPPORTED_LOCALE,
      path: AppConstant.LANG_PATH,
      fallbackLocale: Locale('tr', 'TR'),
      child:const MyApp(),
    ),
  );
}
