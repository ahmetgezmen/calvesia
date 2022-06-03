import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void somethingWrongWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title:const  SometingWrongWidget(),
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

class SometingWrongWidget extends StatelessWidget {
  const SometingWrongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 11.svg",
        semanticsLabel: 'Bir şeyler yanlış gitti logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Bir Şeyler Yanlış Gitti',
              style: TextStyle(
                  fontFamily:'PTSans' ,
                  fontSize: 18,
                  color: Colors.black38
              )
          ),
          const Text('Lütfen tekrar deneyin',
              style: TextStyle(
                  fontFamily:'PTSans' ,
                  fontSize: 12,
                  color: Colors.black12
              )
          )
        ]
    );
  }
}
