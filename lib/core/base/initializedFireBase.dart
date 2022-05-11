import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'AppBase.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> geIinitializedMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase.instance.databaseURL= "https://calvesia-default-rtdb.europe-west1.firebasedatabase.app";
  runApp(
    ProviderScope(child: MyApp()),
  );
}
