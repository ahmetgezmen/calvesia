import 'package:flutter/material.dart';

void PostShareSuccessButton(BuildContext context) {
  final alertDialog = AlertDialog(
    title: PostShareSuccess(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}



class PostShareSuccess extends StatelessWidget {
  const PostShareSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
