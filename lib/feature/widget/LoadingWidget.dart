import 'package:flutter/material.dart';

void LoadingWidgetButton(BuildContext context) {
  final alertDialog = AlertDialog(
    title: LoadingWidget(),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}



class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
