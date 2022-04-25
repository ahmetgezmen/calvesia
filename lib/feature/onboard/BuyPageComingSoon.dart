import 'package:flutter/material.dart';

class Comingsoon extends StatefulWidget {
  const Comingsoon({Key? key}) : super(key: key);

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
