import 'package:calvesia/feature/widget/PostShareFailed.dart';
import 'package:calvesia/feature/widget/PostShareSuccess.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widget/LoadingWidget.dart';
import '../models/post_model.dart';
import '../models/stream_time_model.dart';
import '../services/post_services.dart';

class PostListViewModel extends ChangeNotifier {
  List<PostViewModel> Posts = [];

  Future<void> fetchPosts(String keyword) async {
    // TODO
  }
}

class PostViewModel {
  final PostModel? post;
  PostViewModel({this.post});


  static getPost(postUid) {
    PostServices.getPostServidces(postUid);
  }
}
