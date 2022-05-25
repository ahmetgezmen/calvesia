import 'dart:typed_data';

import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/dob_model.dart';
import '../models/location_model.dart';
import '../models/schools_model.dart';
import '../models/user_model.dart';
import '../services/user_services.dart';

class UserVievModel extends ChangeNotifier{
  final GlobalKey<FormState> myInfoSaveFormKey = GlobalKey<FormState>();

  UserModel user =UserModel(
    dob: Dob(),
    location: Location(),
    schools: Schools(),
  );

  setEmail(val){
    user.setEmail(val);
    notifyListeners();
  }
  setSchoolFaculty(val){
    user.schools!.setFaculty(val);
    notifyListeners();
  }
  setSchoolClassNumber(val){
    user.schools!.setClassNumber(val);
    notifyListeners();
  }
  setSchoolName(val){
    user.schools!.setName(val);
    notifyListeners();
  }
  setUserName(val){
    user.setUserName(val);
    notifyListeners();
  }
  setFname(val){
    user.setFname(val);
    notifyListeners();
  }
  setPhone(val){
    user.setPhone(val);
    notifyListeners();
  }
  setPassword(val){
    user.setPassword(val);
    notifyListeners();
  }
  userFetch() async {
    user = await UserServices.getUserInfoServices(FirebaseAuth.instance.currentUser?.uid);
    notifyListeners();
  }

  Future<Uint8List?> get getMyProfilePhoto async => await UserServices.getProfilePhotos(FirebaseAuth.instance.currentUser!.uid);

  void updateMyInfo(UserModel userModel){
    bool result = UserServices.updateMyInfoServices(userModel);
    notifyListeners();
  }

}
