import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void PostShareSuccessButton(BuildContext context) {
  final alertDialog = AlertDialog(
    title: PostShareSuccess(),
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



class PostShareSuccess extends StatelessWidget {
  const PostShareSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 11.svg",
        semanticsLabel: 'Gönderi paylaşımı başarılı logosu'
    );

    return Container(
        child:Column(
            children:[
              svg,
              Text('Gönderi Paylaşımı Başarılı',
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
