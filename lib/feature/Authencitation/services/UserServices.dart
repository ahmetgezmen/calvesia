import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/RegisteredModel.dart';
import '../models/UserModel.dart';

class UserServices {
  static Future<void> addUser(uuid, emailAddress, password) {
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('users').doc(uuid);
    return users
        .set(
            jsonDecode(userToJson(UserModel(
              isApproved: false,
              isAktive: true,
              email: emailAddress,
              password: password,
              uuid: uuid,
              registered: Registered(
                date: Timestamp.now().toDate().toString(),
              ),
            ))),
            SetOptions(
              merge: true,
            ))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<UserModel> getUserInfoServices(uid) async {
    final _userDataRef = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    UserModel _userModel = await UserModel.fromJson(_userDataRef.data());
    return _userModel;
  }

  static updateMyInfoServices(UserModel userModel) async {
    final db = await FirebaseFirestore.instance;
    final _userDataRef = await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef.update(jsonDecode(userToJson(userModel)));
  }

  static updateMyPhotoServices(photo) async {
    final db = await FirebaseFirestore.instance;
    final _userDataRef = await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    _userDataRef
        .update({"profileImage": photo})
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }


  static Future<String> _getImagePath(uid)async{
    UserModel user = await UserServices.getUserInfoServices(uid);
    return user.profileImage.toString();
  }

  static putProfilePhotosInCamera() async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("ppics");
    final uid =FirebaseAuth.instance.currentUser!.uid;

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (xFile == null){
      return;
    }else {
      final imagePath = xFile.path;
      await ppicsRef.child('$uid.jpg').putFile(File(imagePath));
      bool result = updateMyPhotoServices(ppicsRef.child('$uid.jpg').fullPath);
      if (result==true){
        return true;
      }else{
        return false;
      }
    }
  }

  static putProfilePhotosInGallery() async {
    final storage = FirebaseStorage.instance;
    final ppicsRef = storage.ref("ppics");
    final uid =FirebaseAuth.instance.currentUser!.uid;

    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null){
      return;
    }else {
      final imagePath = xFile.path;
      await ppicsRef.child('$uid.jpg').putFile(File(imagePath));
      bool result = updateMyPhotoServices(ppicsRef.child('$uid.jpg').fullPath);
      return result;
    }
  }


  static Future<Uint8List?> getProfilePhotos(uid)async{
    final path = await _getImagePath(uid);
    Uint8List? uint8List = await FirebaseStorage.instance.ref(path).getData();
    return uint8List;
  }
}
