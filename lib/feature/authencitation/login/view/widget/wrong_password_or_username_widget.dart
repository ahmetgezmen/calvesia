import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void WrongPasswordOrUsernameWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: WrongPasswordOrUsernameWidget(),
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

    return Container(

        child:Column(
            children:[
              svg,
              Text('Kullanıcı Adı veya Şifre Yanlış',
                  style: TextStyle(
                      fontFamily:'PTSans' ,
                      fontSize: 18,
                      color: Colors.black38
                  )
              )
            ]
        )
    );
  }
}
