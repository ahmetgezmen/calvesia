import 'dart:typed_data';

import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_services.dart';

class UserVievModel extends ChangeNotifier{
  final Set<PostModel>MyFavList = UserServices.getUserFavListServices() as Set<PostModel>;
  final UserModel User = UserServices.getUserInfoServices(FirebaseAuth.instance.currentUser!.uid) as UserModel;

  static Future<Uint8List?> get getMyProfilePhoto async => await UserServices.getProfilePhotos(FirebaseAuth.instance.currentUser!.uid);

  void updateMyInfo(UserModel userModel){
    bool result = UserServices.updateMyInfoServices(userModel);
    notifyListeners();
  }

}
