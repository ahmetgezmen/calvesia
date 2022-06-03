import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<bool> postShareFailedButton(BuildContext context) async {
  final alertDialog = AlertDialog(
    title: const PostShareFailed(),
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



class PostShareFailed extends StatelessWidget {
  const PostShareFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 13.svg",
        semanticsLabel: 'Gönderi paylaşımı başarısız oldu logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Gönderi Paylaşımı Başarısız Oldu',
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
