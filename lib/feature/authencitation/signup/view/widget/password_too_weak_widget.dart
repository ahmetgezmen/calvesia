import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTooWeakWidget extends StatelessWidget {
  const PasswordTooWeakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {final Widget svg = SvgPicture.asset("assets/images/Component 23.svg",
      semanticsLabel: 'Şifre çok zayıf logosu'
  );

  return Column(
      children:[
        svg,
        const Text('Şifre çok zayıf, lütfen şifrenize farklı türde karakterler ekleyiniz ',
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



Future<bool> passwordTooWeakWidgetFunction (BuildContext context)async {
  final alertDialog = AlertDialog(
    title: const PasswordTooWeakWidget(),
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(20)
    ),
  );

  await showDialog(
      context: context,
      builder: (BuildContext context) {
    return alertDialog;
  },
  );
  return true;
}
