import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:calvesia/feature/Authencitation/services/user_services.dart';
import 'package:calvesia/feature/pages/models/event_image_list_model.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../Authencitation/models/user_model.dart';
import '../models/post_model.dart';

class ImageServices {
  static putPostImageInCamera(String key, String index) async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("post/ppics/$key");

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (xFile == null) {
      return;
    } else {
      final imagePath = xFile.path;
      await ppicsRef.child('$index$key.jpg').putFile(File(imagePath));
      final fullPath = ppicsRef.child('$index$key.jpg').fullPath;
      PostModel dataBasePost = await PostServices.getPostServidces(key);
      if (dataBasePost.eventImageListModel == null) {
        dataBasePost.setEventImageListModel(
            EventImageListModel(eventImageList: [fullPath]));
      } else {
        if (dataBasePost.eventImageListModel!.eventImageList!
                .contains(fullPath) ==
            false) {
          dataBasePost.eventImageListModel!.eventImageList!.add(fullPath);
        }
      }
      await FirebaseDatabase.instance
          .ref("posts/$key")
          .update(jsonDecode(postModelToJson(dataBasePost)));
    }
  }

  static getPostImageServices(key, index) async {
    Uint8List? uint8List = await FirebaseStorage.instance
        .ref("post/ppics/$key")
        .child('$index$key.jpg')
        .getData();
    return uint8List;
  }

  static deletePostImageService(key, index) async {
    await FirebaseStorage.instance
        .ref("post/ppics/$key")
        .child('$index$key.jpg')
        .delete();
  }
}
