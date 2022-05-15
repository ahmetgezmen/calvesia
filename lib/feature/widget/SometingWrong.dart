import 'package:flutter/material.dart';

void SometingWrongWidgetFunction(BuildContext context) {
  const alertDialog = AlertDialog(
    title: SometingWrongWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

class SometingWrongWidget extends StatelessWidget {
  const SometingWrongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
