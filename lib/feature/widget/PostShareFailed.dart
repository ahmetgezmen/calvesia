import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void PostShareFailedButton(BuildContext context) {
  final alertDialog = AlertDialog(
    title: PostShareFailed(),
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



class PostShareFailed extends StatelessWidget {
  const PostShareFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset("assets/images/Component 13.svg",
        semanticsLabel: 'Gönderi paylaşımı başarısız oldu logosu'
    );

    return Container(
        child:Column(
            children:[
              svg,
              Text('Gönderi Paylaşımı Başarısız Oldu',
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
