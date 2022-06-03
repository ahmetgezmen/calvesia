
import 'package:flutter/material.dart';


import '../models/post_model.dart';

import '../services/post_services.dart';

class PostListViewModel extends ChangeNotifier {
  List<PostViewModel> posts = [];

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
