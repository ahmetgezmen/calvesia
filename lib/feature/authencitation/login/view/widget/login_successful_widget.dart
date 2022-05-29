import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> LoginSuccessfulWidgetFunction(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: LoginSuccessfulWidget(dialogContext: dialogContext),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20)
        ),
      );
    },
  );
}

class LoginSuccessfulWidget extends StatefulWidget {
  final BuildContext dialogContext;
  const LoginSuccessfulWidget({Key? key, required this.dialogContext}) : super(key: key);

  @override
  State<LoginSuccessfulWidget> createState() => _LoginSuccessfulWidgetState();
}

class _LoginSuccessfulWidgetState extends State<LoginSuccessfulWidget> {

  waiting() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(widget.dialogContext).pop();
  }

  @override
  void initState() {
    super.initState();
    waiting();
  }

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 9.svg",
        semanticsLabel: 'Giriş Başarılı Logosu'
    );
    return Column(
        children:[
          svg,
          const Text('Giriş Başarılı',
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
