


import 'package:calvesia/feature/pages/post_page/postpage.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:calvesia/feature/provider/post_provider.dart';
import 'package:flutter/material.dart';

openPostPage(context, PostIsSharingProvider provider )async{
  final postKey = PostServices.startAddPostServices();
  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostSharePage(postKey: postKey, postIsSharingProvider: provider,),));
  final _isShare = provider.getIsShare;
  if (_isShare){
    provider.setIsShare(false);
    return true;
  }else{
    PostServices.isFailedStartAddPostServices(postKey);
  }
}