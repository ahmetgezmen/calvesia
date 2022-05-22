import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendEmailWidget extends StatelessWidget {
  const SendEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 7.svg",
        semanticsLabel: 'Sana bir -e posta gönderdik logosu'
    );

    return Container(

        child:Column(
            children:[
              svg,
              Text('Sana Bir E-posta Gönderdik',
                  style: TextStyle(
                      fontFamily:'PTSans' ,
                      fontSize: 18,
                      color: Colors.black38
                  )
              ),
              Text('E-posta/daki kodu girerek hesabını onaylayabilirsin',
                  style: TextStyle(
                      fontFamily:'PTSans' ,
                      fontSize: 12,
                      color: Colors.black12
                  )
              )
            ]
        )
    );
  }
}

void SendEmailWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: SendEmailWidget(),
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
