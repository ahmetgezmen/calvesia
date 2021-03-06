import 'package:calvesia/feature/Authencitation/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _user = FirebaseAuth.instance.currentUser;

bool _userIsLogin() {
  if (_user != null) {
    return false;
  } else {
    return true;
  }
}

getFavList() async {
  if (_userIsLogin()) {
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
  if (_userIsLogin()) {
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
