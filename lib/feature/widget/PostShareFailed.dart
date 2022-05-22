import 'package:flutter/material.dart';

void PostShareFailedButton(BuildContext context) {
  final alertDialog = AlertDialog(
    title: PostShareFailed(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}



class PostShareFailed extends StatelessWidget {
  const PostShareFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(),
    );
  }
}
