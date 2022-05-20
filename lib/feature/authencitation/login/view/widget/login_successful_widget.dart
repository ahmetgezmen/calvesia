import 'package:flutter/material.dart';

void LoginSuccessfulWidgetFunction(BuildContext context) {
  const alertDialog = AlertDialog(
    title: LoginSuccessfulWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

class LoginSuccessfulWidget extends StatelessWidget {
  const LoginSuccessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
