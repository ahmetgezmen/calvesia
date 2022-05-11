import 'dart:convert';

import 'package:calvesia/feature/onboard/models/PostModel.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref("posts");

class PostRepo {
  static Future<bool> addPostServices(post) async {
    try {
      await ref.push().set(jsonDecode(postModelToJson(post)));
      return true;
    } on Error {
      return false;
    }
  }



  static getPostServidces(postId) async {
    late PostModel postModelData;
    DataSnapshot snapshot = await FirebaseDatabase.instance.ref('posts/$postId/').get();
    if (snapshot.exists) {
      return postModelFromJson(jsonEncode(snapshot.value));
    } else {
      return null;
    }}

//   getPostList(){
//
//   }
//
//
//
}
