import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvalidMailWidget extends StatelessWidget {
  const InvalidMailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 4.svg",
        semanticsLabel: 'Geçersiz e-posta logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Geçersiz E-posta',
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

void invalidMailWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: const InvalidMailWidget(),
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
