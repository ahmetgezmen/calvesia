import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailAlredyUseWidget extends StatelessWidget {
  const EmailAlredyUseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 15.svg",
        semanticsLabel: 'Bu e-posta zaten kullanılıyor logosu'
    );
    return Container(
        child:Column(
            children:[
              svg,
              const Text('Bu E-posta Zaten Kullanılıyor',
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

void EmailAlredyUseWidgetFunction(BuildContext context) {
  final alertDialog = AlertDialog(
    title: const EmailAlredyUseWidget(),
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
