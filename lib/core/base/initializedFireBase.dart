import 'package:firebase_core/firebase_core.dart';
import '../../feature/onboard/HomePage.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool  _isInitialialized = false;
  @override
  void initState() {
    super.initState();
    initilalized();
  }

  Future<void> initilalized() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  setState(() {
    _isInitialialized = true;

  });
  }


  @override
  Widget build(BuildContext context) {
    return _isInitialialized ? HomePage() : CircularProgressIndicator();
  }
}



