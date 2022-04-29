import 'package:flutter/material.dart';

void WrongPasswordOrUsernameWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: WrongPasswordOrUsernameWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

class WrongPasswordOrUsernameWidget extends StatelessWidget {
  const WrongPasswordOrUsernameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
