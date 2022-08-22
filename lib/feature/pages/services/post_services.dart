import 'dart:convert';

import 'package:calvesia/feature/pages/models/post_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../provider/post_provider.dart';
import '../../widget/loading_widget.dart';
import '../../widget/post_share_failed.dart';
import '../../widget/post_share_success.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref("posts");
String uid = FirebaseAuth.instance.currentUser!.uid;

class PostServices {
  static Future<bool> addPostServices(
      context, PostModel post, key, provider) async {
    try {
      loadingWidgetButton(context);

      await FirebaseDatabase.instance
          .ref("posts/$key")
          .update(jsonDecode(postModelToJson(post)));

      // await ref.push().set(jsonDecode(postModelToJson(post)));
      Navigator.of(context).pop();
      await postShareSuccessButton(context);
      provider.setIsShare(true);
      return true;
    } on Error {
      await postShareFailedButton(context);
      return false;
    }
  }

  static updatePostService(PostModel post, String key) async {
    try {
      await FirebaseDatabase.instance.ref("posts/$key").update(jsonDecode(postModelToJson(post)));
      return true;
    } catch (e) {
      return false;
    }
  }

  static startAddPostServices() {
    final newPostKey =
        FirebaseDatabase.instance.ref().child('posts').push().key;
    return newPostKey;
  }

  static isFailedStartAddPostServices(key) {
    FirebaseDatabase.instance.ref('posts/$key').remove();
  }

  static getPostServidces(postId) async {
    late PostModel postModelData;
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('posts/$postId/').get();
    if (snapshot.exists) {
      return postModelFromJson(jsonEncode(snapshot.value));
    } else {
      return null;
    }
  }

//   getPostList(){
//
//   }
//
//
//
}
