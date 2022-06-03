import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<bool> postShareSuccessButton(BuildContext context)async {
  final alertDialog = AlertDialog(
    title: const PostShareSuccess(),
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



class PostShareSuccess extends StatelessWidget {
  const PostShareSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 11.svg",
        semanticsLabel: 'Gönderi paylaşımı başarılı logosu'
    );

    return Column(
        children:[
          svg,
          const Text('Gönderi Paylaşımı Başarılı',
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
