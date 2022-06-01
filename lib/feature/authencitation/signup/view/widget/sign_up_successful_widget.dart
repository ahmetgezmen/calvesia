import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> SignUpSuccessfulWidgetFunction(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: SignUpSuccessfulWidget(dialogContext: dialogContext),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20)
        ),
      );
    },
  );
}

class SignUpSuccessfulWidget extends StatefulWidget {
  final BuildContext dialogContext;
  const SignUpSuccessfulWidget({Key? key, required this.dialogContext}) : super(key: key);

  @override
  State<SignUpSuccessfulWidget> createState() => _SignUpSuccessfulWidgetState();
}

class _SignUpSuccessfulWidgetState extends State<SignUpSuccessfulWidget> {

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
        semanticsLabel: 'Kayit Başarılı Logosu'
    );
    return Column(
        children:[
          svg,
          const Text('Kayit Başarılı',
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
