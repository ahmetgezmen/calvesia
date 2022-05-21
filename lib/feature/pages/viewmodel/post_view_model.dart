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

  static addPost(
      key,
      provider,
      context,
      title,
      category,
      description,
      isPrivate,
      price,
      eventPlaceLocationTitle,
      location,
      date,
      time,
      image,
      isCertificated,
      ticketNumber,
      eventWebSiteUrl,
      ) async {
    LoadingWidgetButton(context);

    PostModel post = await PostModel(
      eventWebSiteUrl: eventWebSiteUrl,
      title: title,
      isPrivate: isPrivate,
      description: description,
      category: category,
      eventPlaceLocationTitle: eventPlaceLocationTitle,
      location: location,
      image: image,
      streamTime: StreamTime(
          date: Timestamp.now().toDate().toString().split(' ')[0],
          time: Timestamp.now().toDate().toString().split(' ')[1]),
      date: date,
      time: time,
      price: price,
      viewNumber: 0,
      isCertificated: isCertificated,
      ticketNumber: ticketNumber,
      postOwner: FirebaseAuth.instance.currentUser!.uid,
      followersNumber: 0,
      isAktive: true,
    );

    final credential = await PostServices.addPostServices(context , post,key, provider);
    Navigator.of(context).pop();

    credential == true
        ? PostShareSuccessButton(context)
        : PostShareFailedButton(context);
  }

  static getPost(postUid) {
    PostServices.getPostServidces(postUid);
  }
}
