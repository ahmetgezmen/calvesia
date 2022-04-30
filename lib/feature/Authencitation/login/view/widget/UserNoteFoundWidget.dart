import 'package:flutter/material.dart';

void UserNoteFoundWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: UserNoteFoundWidget(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

class UserNoteFoundWidget extends StatelessWidget {
  const UserNoteFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
