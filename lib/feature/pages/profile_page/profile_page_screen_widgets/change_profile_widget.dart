import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ChangeProfileImageWidgetButton(BuildContext context) {
  const alertDialogAnon = AlertDialog(
    title: _Anonymous(),
  );

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return FirebaseAuth.instance.currentUser!.isAnonymous
          ? alertDialogAnon
          : AlertDialog(
        title: ChangeProfileImageWidget(dialogContext: dialogContext,),
      );;
    },
  );
}

class _Anonymous extends StatelessWidget {
  const _Anonymous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext dialogContext) {
    return const Center(
      child: Text("Lütfen giriş yapın veya kayıt olun"),
    );
  }
}

class ChangeProfileImageWidget extends StatelessWidget {
  final dialogContext;
  const ChangeProfileImageWidget({Key? key, this.dialogContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              onPressed: () async {
                await UserServices.putProfilePhotosInCamera();
                Navigator.of(dialogContext).pop();
              },
              icon: const Icon(Icons.camera_alt)),
          IconButton(
              onPressed: () async {
                await UserServices.putProfilePhotosInGallery();
                Navigator.of(dialogContext).pop();
              },
              icon: const Icon(Icons.photo_library)),
        ],
      ),
    );
  }
}
