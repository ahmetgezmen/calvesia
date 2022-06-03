import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void wrongPasswordOrUsernameWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: const WrongPasswordOrUsernameWidget(),
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

class WrongPasswordOrUsernameWidget extends StatelessWidget {
  const WrongPasswordOrUsernameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Widget svg = SvgPicture.asset("assets/images/Default.svg",
        semanticsLabel: 'Kullanıcı adı veya şifre yanlış Logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Kullanıcı Adı veya Şifre Yanlış',
              style:  TextStyle(
                  fontFamily:'PTSans' ,
                  fontSize: 18,
                  color: Colors.black38
              )
          )
        ]
    );
  }
}
