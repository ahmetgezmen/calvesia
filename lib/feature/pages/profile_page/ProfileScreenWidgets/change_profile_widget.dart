import 'package:calvesia/feature/Authencitation/services/UserServices.dart';
import 'package:flutter/material.dart';

ChangeProfileImageWidgetButton(BuildContext context) {
  const alertDialog = AlertDialog(
    title: ChangeProfileImageWidget(),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              onPressed: () async {
                await UserServices.putProfilePhotosInCamera();
              },
              icon: const Icon(Icons.camera_alt)),
          IconButton(
              onPressed: () async {
                await UserServices.putProfilePhotosInGallery();
              },
              icon: const Icon(Icons.photo_library)),
        ],
      ),
    );
  }
}
