import 'package:flutter/material.dart';

class SendEmailWidget extends StatelessWidget {
  const SendEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void SendEmailWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: SendEmailWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}