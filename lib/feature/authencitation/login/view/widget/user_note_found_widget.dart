import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void userNoteFoundWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: const UserNoteFoundWidget(),
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20)
    ),
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

    final Widget svg = SvgPicture.asset("assets/images/Default.svg",
        semanticsLabel: 'Kullanıcı Bulunamadı Logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Kullanıcı Bulunamadı',
              style: TextStyle(
                  fontFamily:'PTSans' ,
                  fontSize: 18,
                  color: Colors.black38
              )
          )
        ]
    );
  }
}
