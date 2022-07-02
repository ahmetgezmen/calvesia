import 'package:calvesia/feature/pages/models/event_image_list_model.dart';
import 'package:calvesia/feature/pages/models/post_model.dart';
import 'package:calvesia/feature/pages/services/post_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/models/coordinators_model.dart';
import '../pages/models/sponsor_model.dart';
import '../pages/models/stream_time_model.dart';

class PostIsSharingAndShowingProvider extends ChangeNotifier{
  String _postKey = "";
  bool _isShare = false;
  bool _isShow = false;
  void setIsShare(bool value){
    _isShare = value;
    notifyListeners();
  }
  void setIsShow(bool value){
    _isShow = value;
    notifyListeners();
  }
  void setPostKey(String val){
    _postKey=val;
    notifyListeners();
  }
  bool get getIsShare => _isShare;
  bool get getIsShow => _isShow;
  String get getPostKey => getPostKey;
}

class PostShareProvider extends ChangeNotifier {
  final String _postOwner = FirebaseAuth.instance.currentUser!.uid;
  final bool _isAktive = true;
  bool? _isNeedCV;
  bool? _isOnline;
  String? _title;
  String? _category;
  bool? _isPrivate;
  String? _date;
  String? _time;
  String? _endDate;
  String? _endTime;
  String? _platformLink;
  String? _eventPlaceLocationTitle;
  String? _location;
  String? _image;
  String? _eventWebSiteUrl;
  String? _description;
  bool? _isCertificated;
  int? _ticketNumber;
  final int _viewNumber = 0;
  int _price = 0;
  final int _reversedDate =  int.parse(Timestamp.now().toDate().toString().split(' ')[0].split("-").join());
  final int _followersNumber=0;
  final int _reversedFollowersNumber=0;
  Sponsors? _sponsors;
  Coordinators? _coordinators;

  Future<bool> addPost(context, key, PostIsSharingAndShowingProvider provider, postKey ) async {
    PostModel post = PostModel(
      postKey: postKey,
      reversedDate: _reversedDate,
      eventImageListModel: EventImageListModel(eventImageList: []),
      isAktive: _isAktive,
      isNeedCV: _isNeedCV,
      isOnline: _isOnline,
      isPrivate: _isPrivate,
      endDate: _endDate,
      endTime: _endTime,
      eventWebSiteUrl: _eventWebSiteUrl,
      description: _description,
      isCertificated: _isCertificated,
      ticketNumber: _ticketNumber,
      viewNumber: _viewNumber,
      price: _price,
      coordinators: _coordinators,
      platformLink: _platformLink,
      eventPlaceLocationTitle: _eventPlaceLocationTitle,
      location: _location,
      followersNumber: _followersNumber,
      reversedFollowersNumber: _reversedFollowersNumber,
      postOwner: _postOwner,
      streamTime: StreamTime(
        date: Timestamp.now().toDate().toString().split(' ')[0],
        time: Timestamp.now().toDate().toString().split(' ')[1],
        full: Timestamp.now().toDate().toString().split(" ")[0].split("-").join()+Timestamp.now().toDate().toString().split(" ")[1].split(":").join().split(".").join().toString(),
      ),
      sponsors: _sponsors,
      category: _category,
      title: _title,
      time: _time,
      date: _date
    );
    final _result = await PostServices.addPostServices(context, post, key, provider );
    return _result;
  }

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void setIsPrivate(bool isPrivate) {
    _isPrivate = isPrivate;
    notifyListeners();
  }

  void setDate(date) {
    _date = date;
    notifyListeners();
  }

  void setTime(time) {
    _time = time;
    notifyListeners();
  }

  void setendDate(date) {
    _endDate = date;
    notifyListeners();
  }

  void setendTime(time) {
    _endTime = time;
    notifyListeners();
  }

  void setIsOnline(bool isOnline) {
    _isOnline = isOnline;
    notifyListeners();
  }

  void setEventPlaceLocationTitle(String title) {
    _eventPlaceLocationTitle = title;
    notifyListeners();
  }

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void setPlatformLink(String link) {
    _platformLink = link;
    notifyListeners();
  }

  void setDescription(String desc) {
    _description = desc;
    notifyListeners();
  }

  void setEventWebSiteUrl(String eventWebSiteUrl) {
    _eventWebSiteUrl = eventWebSiteUrl;
    notifyListeners();
  }

  void setIsCertificated(bool isCertificated) {
    _isCertificated = isCertificated;
    notifyListeners();
  }

  void setIsNeedCV(bool isNeedCV) {
    _isNeedCV = isNeedCV;
    notifyListeners();
  }

  void setTicketNumber(int number) {
    _ticketNumber = number;
    notifyListeners();
  }

  void setPrice(int price) {
    _price = price;
    notifyListeners();
  }

  void setSponsors(List<String> sponsors) {
    _sponsors = Sponsors(sponsors: sponsors);
    notifyListeners();
  }

  void setCoordinators(List<String> coordinators) {
    _coordinators = Coordinators(coordinators: coordinators);
    notifyListeners();
  }
}
