import 'package:calvesia/feature/Authencitation/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _user = FirebaseAuth.instance.currentUser;

bool _UserIsLogin() {
  if (_user != null) {
    return false;
  } else {
    return true;
  }
}

GetFavList() async {
  if (_UserIsLogin()) {
    final _usersDataDocumentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .get();
    final _userdata = UserModel.fromJson(_usersDataDocumentSnapshot);
    return _userdata.favList;
  } else {
    return null;
  }
}

postIsFavList(post) async {
  if (_UserIsLogin()) {
    final _usersDataDocumentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .get();
    final _userdata = UserModel.fromJson(_usersDataDocumentSnapshot);
    return _userdata.favList!.contains(post);
  } else {
    return null;
  }
}
