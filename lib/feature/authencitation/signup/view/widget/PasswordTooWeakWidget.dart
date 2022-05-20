import 'package:flutter/material.dart';

class PasswordTooWeakWidget extends StatelessWidget {
  const PasswordTooWeakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void PasswordTooWeakWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: PasswordTooWeakWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
