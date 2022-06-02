import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/pages/post_page/post_share_page.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:calvesia/feature/provider/post_provider.dart';
import 'package:flutter/material.dart';

import '../services/image_services.dart';

openPostPage(context, PostIsSharingAndShowingProvider provider) async {
  final _postKey = PostServices.startAddPostServices();
  await PostServices.updatePostService(PostModel(title: "deneme"), _postKey);
  provider.setPostKey(_postKey);
  await Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => PostSharePage(
      postKey: _postKey,
      postIsSharingProvider: provider,
    ),
  ));
  final _isShare = provider.getIsShare;
  if (_isShare) {
    provider.setIsShare(false);
    provider.setPostKey("");
    return true;
  } else {
    for(int i =1 ; i<7 ; i++){
      try{
        ImageServices.deletePostImageService(_postKey,i);
      } catch(e){}
    }
    PostServices.isFailedStartAddPostServices(_postKey);
  }
}
