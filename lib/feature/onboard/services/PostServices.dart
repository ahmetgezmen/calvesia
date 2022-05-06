import 'dart:convert';

import 'package:calvesia/feature/onboard/models/PostModel.dart';
import 'package:firebase_database/firebase_database.dart';



DatabaseReference ref = FirebaseDatabase.instance.ref("posts");

class PostRepo {
  
    static Future<bool> addPostServices(post) async {
      try{
        await ref.push().set(jsonDecode(postModelToJson(post)));
        return true;
      }on Error {
        return false;
      }
    }


//
//   getPost(){
//     DatabaseReference starCountRef =
//     FirebaseDatabase.instance.ref('posts/$postId/');
//     starCountRef.onValue.listen((DatabaseEvent event) {
//       final data = event.snapshot.value;
//       updateStarCount(data);
//     });
//   }
//
//   getPostList(){
//
//   }
//
//
//
}