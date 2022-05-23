import 'dart:typed_data';

import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_services.dart';

class UserVievModel extends ChangeNotifier{
  UserModel user =UserModel();
  userFetch() async {
    user = await UserServices.getUserInfoServices(FirebaseAuth.instance.currentUser?.uid);
  }

  Future<Uint8List?> get getMyProfilePhoto async => await UserServices.getProfilePhotos(FirebaseAuth.instance.currentUser!.uid);

  void updateMyInfo(UserModel userModel){
    bool result = UserServices.updateMyInfoServices(userModel);
    notifyListeners();
  }

}
