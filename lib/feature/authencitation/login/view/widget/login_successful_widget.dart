import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void LoginSuccessfulWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: LoginSuccessfulWidget(),
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

class LoginSuccessfulWidget extends StatelessWidget {
  const LoginSuccessfulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 9.svg",
        semanticsLabel: 'Giriş Başarılı Logosu'
    );

    return Container(
        child:Column(
            children:[
              svg,
              Text('Giriş Başarılı',
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
