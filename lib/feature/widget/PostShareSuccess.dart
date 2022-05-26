import 'package:flutter/material.dart';

Future<bool> PostShareSuccessButton(BuildContext context)async {
  final alertDialog = AlertDialog(
    title: PostShareSuccess(),
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
  return true;
}



class PostShareSuccess extends StatelessWidget {
  const PostShareSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("islem basarili")),
    );
  }
}
