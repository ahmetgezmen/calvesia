import 'dart:convert';

import 'comments_model.dart';
import 'coordinators_model.dart';
import 'event_image_list_model.dart';
import 'sponsor_model.dart';
import 'stream_time_model.dart';

/// isAktive : true
/// title : "Event title"
/// category : "Etkinlik kategorisi"
/// isPrivate : false
/// date : "date"
/// endDate : "endDate"
/// time : "time"
/// endTime : "endTime"
/// eventPlaceLocationTitle : "mekan yeri "
/// location : " dETAYLI ETKINLIK YERI "
/// image : "imagePath"
/// description : "Aciklama"
/// isCertificated : false
/// ticketNumber : 100
/// viewNumber : 100
/// price : 100
/// postOwner : "paylasanin uid"
/// followersNumber : 1999
/// participants : {"participantuid":"profileImagePath"}
/// comments : {"commentUid":{"uuid":"paylasan kisinin uuid","commentDsc":"Comment aciklamasi","Star":5,"helpfulCount":1000}}
/// streamTime : {"date":"streamDate","time":"streamTime"}

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    bool? isAktive,
    bool? isOnline,
    bool? isNeedCV,
    String? title,
    String? category,
    bool? isPrivate,
    String? date,
    int? reversedDate,
    String? endDate,
    String? time,
    String? endTime,
    String? eventPlaceLocationTitle,
    String? eventWebSiteUrl,
    String? location,
    String? platformLink,
    String? image,
    String? description,
    String? postKey,
    bool? isCertificated,
    int? ticketNumber,
    int? viewNumber,
    int? price,
    String? postOwner,
    int? followersNumber,
    int? reversedFollowersNumber,
    Sponsors? sponsors,
    EventImageListModel? eventImageListModel,
    Coordinators? coordinators,
    Comments? comments, // bunlar eklenmedi
    StreamTime? streamTime,
  }) {
    _isAktive = isAktive;
    _isOnline = isOnline;
    _isNeedCV = isNeedCV;
    _title = title;
    _category = category;
    _isPrivate = isPrivate;
    _date = date;
    _endDate = endDate;
    _time = time;
    _endTime = endTime;
    _eventPlaceLocationTitle = eventPlaceLocationTitle;
    _eventWebSiteUrl = eventWebSiteUrl;
    _location = location;
    _platformLink = platformLink;
    _image = image;
    _description = description;
    _postKey = postKey;
    _isCertificated = isCertificated;
    _ticketNumber = ticketNumber;
    _viewNumber = viewNumber;
    _price = price;
    _reversedDate = reversedDate;
    _postOwner = postOwner;
    _followersNumber = followersNumber;
    _reversedFollowersNumber = reversedFollowersNumber;
    _sponsors = sponsors;
    _eventImageListModel = eventImageListModel;
    _coordinators = coordinators;
    _comments = comments;
    _streamTime = streamTime;
  }

  PostModel.fromJson(dynamic json) {
    _isAktive = json['isAktive'];
    _isOnline = json['isOnline'];
    _isNeedCV = json['isNeedCV'];
    _title = json['title'];
    _category = json['category'];
    _isPrivate = json['isPrivate'];
    _date = json['date'];
    _endDate = json['endDate'];
    _time = json['time'];
    _endTime = json['endTime'];
    _eventPlaceLocationTitle = json['eventPlaceLocationTitle'];
    _eventWebSiteUrl = json['eventWebSiteUrl'];
    _location = json['location'];
    _platformLink = json['platformLink'];
    _image = json['image'];
    _description = json['description'];
    _postKey = json['postKey'];
    _isCertificated = json['isCertificated'];
    _ticketNumber = json['ticketNumber'];
    _viewNumber = json['viewNumber'];
    _price = json['price'];
    _reversedDate = json['reversedDate'];
    _postOwner = json['postOwner'];
    _followersNumber = json['followersNumber'];
    _reversedFollowersNumber = json['reversedFollowersNumber'];
    _sponsors =
        json['sponsors'] != null ? Sponsors.fromJson(json['sponsors']) : null;
    _eventImageListModel = json['eventImageListModel'] != null
        ? EventImageListModel.fromJson(json['eventImageListModel'])
        : null;
    _coordinators = json['coordinators'] != null
        ? Coordinators.fromJson(json['coordinators'])
        : null;
    _comments =
        json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    _streamTime = json['streamTime'] != null
        ? StreamTime.fromJson(json['streamTime'])
        : null;
  }
  bool? _isAktive;
  bool? _isOnline;
  bool? _isNeedCV;
  String? _title;
  String? _category;
  bool? _isPrivate;
  String? _date;
  String? _endDate;
  String? _time;
  String? _endTime;
  String? _eventPlaceLocationTitle;
  String? _eventWebSiteUrl;
  String? _location;
  String? _platformLink;
  String? _image;
  String? _description;
  String? _postKey;
  bool? _isCertificated;
  int? _ticketNumber;
  int? _viewNumber;
  int? _price;
  int? _reversedDate;
  String? _postOwner;
  int? _followersNumber;
  int? _reversedFollowersNumber;
  Sponsors? _sponsors;
  EventImageListModel? _eventImageListModel;
  Coordinators? _coordinators;
  Comments? _comments;
  StreamTime? _streamTime;
  PostModel copyWith({
    bool? isAktive,
    bool? isOnline,
    bool? isNeedCV,
    String? title,
    String? category,
    bool? isPrivate,
    String? date,
    String? endDate,
    String? time,
    String? endTime,
    String? eventPlaceLocationTitle,
    String? eventWebSiteUrl,
    String? location,
    String? platformLink,
    String? image,
    String? description,
    String? postKey,
    bool? isCertificated,
    int? ticketNumber,
    int? viewNumber,
    int? price,
    int? reversedDate,
    String? postOwner,
    int? followersNumber,
    int? reversedFollowersNumber,
    Sponsors? sponsors,
    EventImageListModel? eventImageListModel,
    Coordinators? coordinators,
    Comments? comments,
    StreamTime? streamTime,
  }) =>
      PostModel(
        isAktive: isAktive ?? _isAktive,
        isOnline: isOnline ?? _isOnline,
        isNeedCV: isNeedCV ?? _isNeedCV,
        title: title ?? _title,
        category: category ?? _category,
        isPrivate: isPrivate ?? _isPrivate,
        date: date ?? _date,
        endDate: endDate ?? _endDate,
        time: time ?? _time,
        endTime: endTime ?? _endTime,
        eventPlaceLocationTitle:
            eventPlaceLocationTitle ?? _eventPlaceLocationTitle,
        eventWebSiteUrl: eventWebSiteUrl ?? _eventWebSiteUrl,
        location: location ?? _location,
        platformLink: platformLink ?? _platformLink,
        image: image ?? _image,
        description: description ?? _description,
        postKey: postKey ?? _postKey,
        isCertificated: isCertificated ?? _isCertificated,
        ticketNumber: ticketNumber ?? _ticketNumber,
        viewNumber: viewNumber ?? _viewNumber,
        price: price ?? _price,
        reversedDate: reversedDate?? _reversedDate,
        postOwner: postOwner ?? _postOwner,
        followersNumber: followersNumber ?? _followersNumber,
        reversedFollowersNumber: reversedFollowersNumber ?? _reversedFollowersNumber,
        sponsors: sponsors ?? _sponsors,
        eventImageListModel: eventImageListModel ?? _eventImageListModel,
        coordinators: coordinators ?? _coordinators,
        comments: comments ?? _comments,
        streamTime: streamTime ?? _streamTime,
      );
  bool? get isAktive => _isAktive;
  bool? get isOnline => _isOnline;
  bool? get isNeedCV => _isNeedCV;
  String? get title => _title;
  String? get category => _category;
  bool? get isPrivate => _isPrivate;
  String? get date => _date;
  String? get endDate => _endDate;
  String? get time => _time;
  String? get endTime => _endTime;
  String? get eventPlaceLocationTitle => _eventPlaceLocationTitle;
  String? get eventWebSiteUrl => _eventWebSiteUrl;
  String? get location => _location;
  String? get platformLink => _platformLink;
  String? get image => _image;
  String? get description => _description;
  String? get postKey => _postKey;
  bool? get isCertificated => _isCertificated;
  int? get ticketNumber => _ticketNumber;
  int? get viewNumber => _viewNumber;
  int? get price => _price;
  int? get reversedDate => _reversedDate;
  String? get postOwner => _postOwner;
  int? get followersNumber => _followersNumber;
  int? get reversedFollowersNumber => _reversedFollowersNumber;
  Sponsors? get sponsors => _sponsors;
  EventImageListModel? get eventImageListModel => _eventImageListModel;
  Coordinators? get coordinators => _coordinators;
  Comments? get comments => _comments;
  StreamTime? get streamTime => _streamTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAktive'] = _isAktive;
    map['isOnline'] = _isOnline;
    map['isNeedCV'] = _isNeedCV;
    map['title'] = _title;
    map['category'] = _category;
    map['isPrivate'] = _isPrivate;
    map['date'] = _date;
    map['endDate'] = _endDate;
    map['time'] = _time;
    map['endTime'] = _endTime;
    map['eventPlaceLocationTitle'] = _eventPlaceLocationTitle;
    map['eventWebSiteUrl'] = _eventWebSiteUrl;
    map['location'] = _location;
    map['platformLink'] = _platformLink;
    map['image'] = _image;
    map['postKey'] = _postKey;
    map['description'] = _description;
    map['isCertificated'] = _isCertificated;
    map['ticketNumber'] = _ticketNumber;
    map['viewNumber'] = _viewNumber;
    map['price'] = _price;
    map['reversedDate'] = _reversedDate;
    map['postOwner'] = _postOwner;
    map['followersNumber'] = _followersNumber;
    map['reversedFollowersNumber'] = _reversedFollowersNumber;
    if (_sponsors != null) {
      map['sponsors'] = _sponsors?.toJson();
    }
    if (_eventImageListModel != null) {
      map['eventImageListModel'] = _eventImageListModel?.toJson();
    }
    if (_coordinators != null) {
      map['coordinators'] = _coordinators?.toJson();
    }
    if (_comments != null) {
      map['comments'] = _comments?.toJson();
    }
    if (_streamTime != null) {
      map['streamTime'] = _streamTime?.toJson();
    }
    return map;
  }

  void setEventImageListModel(EventImageListModel eventImageListModel) {
    _eventImageListModel = eventImageListModel;
  }

  void increaseFavNumber() {
    if (_followersNumber != null) {
      _followersNumber = _followersNumber! - 1;
    }
    if (_reversedFollowersNumber != null) {
      _reversedFollowersNumber = _reversedFollowersNumber! + 1;
    }
  }

  void decreaseFavNumber() {
    if (_followersNumber != null) {
      _followersNumber = _followersNumber! + 1;
    }
    if (_reversedFollowersNumber != null) {
      _reversedFollowersNumber = _reversedFollowersNumber! - 1;
    }
  }
}

//
// {
// "isAktive": true,
// "isOnline": true,
// "isNeedCV": true,
// "title" : "Event title",
// "category" : "Etkinlik kategorisi",
// "isPrivate" : false,
// "date": "date",
// "endDate": "endDate",
// "time": "time",
// "endTime": "endTime",
// "eventPlaceLocationTitle": "mekan yeri ",
// "eventWebSiteUrl": "eventWebSiteUrl ",
// "location": " dETAYLI ETKINLIK YERI ",
// "platformLink": " etkinlik linki ",
// "image": "imagePath",
// "description": "Aciklama",
// "isCertificated" : false,
// "ticketNumber" : 100,
// "viewNumber" : 2,
// "price": 100,
// "postOwner": "paylasanin uid",
// "followersNumber": 1999,
// "sponsors" : {
// "participantuid" : "profileImagePath"
// },
//"coordinators":[],
// "comments": {
// "commentUid": {
// "uuid":"paylasan kisinin uuid",
// "commentDsc":"Comment aciklamasi",
// "Star":5,
// "helpfulCount":1000
// }
// },
// "streamTime": {
// "date": "streamDate",
// "time": "streamTime"
// }
// }
