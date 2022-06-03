import 'package:flutter/material.dart';

void loadingWidgetButton(BuildContext context) {
  const alertDialog =  AlertDialog(
    title:  LoadingWidget(),
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
    return const Center(child: CircularProgressIndicator());
  }
}
