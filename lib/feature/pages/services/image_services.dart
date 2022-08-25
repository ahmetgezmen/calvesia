import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:calvesia/feature/pages/models/event_image_list_model.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


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

  static putPostImageInGallery(String key, String index) async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("post/ppics/$key");

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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
    try{
      Uint8List? uint8List = await FirebaseStorage.instance
          .ref("post/ppics/$key")
          .child('$index$key.jpg')
          .getData();
      return uint8List;
    } catch (e){
      return null ;
    }
  }
  static getPostImageServicesforCardComponent(key, index) async {
    try{
      Uint8List? uint8List = await FirebaseStorage.instance
          .ref("post/ppics/$key")
          .child('$index$key.jpg')
          .getData();
      return uint8List;
    } catch (e){
      return false;
    }
  }

  static deletePostImageService(key, index) async {
    try{
      await FirebaseStorage.instance
          .ref("post/ppics/$key")
          .child('$index$key.jpg')
          .delete();
    }catch (e){
    }
  }
}
