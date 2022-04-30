import 'package:flutter/material.dart';

class EmailAlredyUseWidget extends StatelessWidget {
  const EmailAlredyUseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void EmailAlredyUseWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: EmailAlredyUseWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
