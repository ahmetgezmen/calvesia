import 'package:flutter/material.dart';

Future<bool> PostShareFailedButton(BuildContext context) async {
  final alertDialog = AlertDialog(
    title: PostShareFailed(),
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
  return true;
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
