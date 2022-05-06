import 'dart:convert';

import 'CommentsModel.dart';
import 'ParticipantsModel.dart';
import 'StreamTimeModel.dart';
/// isAktive : true
/// title : "Event title"
/// category : "Etkinlik kategorisi"
/// isPrivate : false
/// date : "date"
/// time : "time"
/// eventPlaceLocationTitle : "mekan yeri "
/// location : " dETAYLI ETKINLIK YERI "
/// image : "imagePath"
/// description : "Aciklama"
/// isCertificated : false
/// ticketNumber : 100
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
      String? title, 
      String? category, 
      bool? isPrivate, 
      String? date, 
      String? time, 
      String? eventPlaceLocationTitle, 
      String? location, 
      String? image, 
      String? description, 
      bool? isCertificated, 
      int? ticketNumber, 
      int? price, 
      String? postOwner, 
      int? followersNumber, 
      Participants? participants,   // bunlar eklenmedi
      Comments? comments,           // bunlar eklenmedi
      StreamTime? streamTime,}){
    _isAktive = isAktive;
    _title = title;
    _category = category;
    _isPrivate = isPrivate;
    _date = date;
    _time = time;
    _eventPlaceLocationTitle = eventPlaceLocationTitle;
    _location = location;
    _image = image;
    _description = description;
    _isCertificated = isCertificated;
    _ticketNumber = ticketNumber;
    _price = price;
    _postOwner = postOwner;
    _followersNumber = followersNumber;
    _participants = participants;
    _comments = comments;
    _streamTime = streamTime;
}

  PostModel.fromJson(dynamic json) {
    _isAktive = json['isAktive'];
    _title = json['title'];
    _category = json['category'];
    _isPrivate = json['isPrivate'];
    _date = json['date'];
    _time = json['time'];
    _eventPlaceLocationTitle = json['eventPlaceLocationTitle'];
    _location = json['location'];
    _image = json['image'];
    _description = json['description'];
    _isCertificated = json['isCertificated'];
    _ticketNumber = json['ticketNumber'];
    _price = json['price'];
    _postOwner = json['postOwner'];
    _followersNumber = json['followersNumber'];
    _participants = json['participants'] != null ? Participants.fromJson(json['participants']) : null;
    _comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    _streamTime = json['streamTime'] != null ? StreamTime.fromJson(json['streamTime']) : null;
  }
  bool? _isAktive;
  String? _title;
  String? _category;
  bool? _isPrivate;
  String? _date;
  String? _time;
  String? _eventPlaceLocationTitle;
  String? _location;
  String? _image;
  String? _description;
  bool? _isCertificated;
  int? _ticketNumber;
  int? _price;
  String? _postOwner;
  int? _followersNumber;
  Participants? _participants;
  Comments? _comments;
  StreamTime? _streamTime;
PostModel copyWith({  bool? isAktive,
  String? title,
  String? category,
  bool? isPrivate,
  String? date,
  String? time,
  String? eventPlaceLocationTitle,
  String? location,
  String? image,
  String? description,
  bool? isCertificated,
  int? ticketNumber,
  int? price,
  String? postOwner,
  int? followersNumber,
  Participants? participants,
  Comments? comments,
  StreamTime? streamTime,
}) => PostModel(  isAktive: isAktive ?? _isAktive,
  title: title ?? _title,
  category: category ?? _category,
  isPrivate: isPrivate ?? _isPrivate,
  date: date ?? _date,
  time: time ?? _time,
  eventPlaceLocationTitle: eventPlaceLocationTitle ?? _eventPlaceLocationTitle,
  location: location ?? _location,
  image: image ?? _image,
  description: description ?? _description,
  isCertificated: isCertificated ?? _isCertificated,
  ticketNumber: ticketNumber ?? _ticketNumber,
  price: price ?? _price,
  postOwner: postOwner ?? _postOwner,
  followersNumber: followersNumber ?? _followersNumber,
  participants: participants ?? _participants,
  comments: comments ?? _comments,
  streamTime: streamTime ?? _streamTime,
);
  bool? get isAktive => _isAktive;
  String? get title => _title;
  String? get category => _category;
  bool? get isPrivate => _isPrivate;
  String? get date => _date;
  String? get time => _time;
  String? get eventPlaceLocationTitle => _eventPlaceLocationTitle;
  String? get location => _location;
  String? get image => _image;
  String? get description => _description;
  bool? get isCertificated => _isCertificated;
  int? get ticketNumber => _ticketNumber;
  int? get price => _price;
  String? get postOwner => _postOwner;
  int? get followersNumber => _followersNumber;
  Participants? get participants => _participants;
  Comments? get comments => _comments;
  StreamTime? get streamTime => _streamTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAktive'] = _isAktive;
    map['title'] = _title;
    map['category'] = _category;
    map['isPrivate'] = _isPrivate;
    map['date'] = _date;
    map['time'] = _time;
    map['eventPlaceLocationTitle'] = _eventPlaceLocationTitle;
    map['location'] = _location;
    map['image'] = _image;
    map['description'] = _description;
    map['isCertificated'] = _isCertificated;
    map['ticketNumber'] = _ticketNumber;
    map['price'] = _price;
    map['postOwner'] = _postOwner;
    map['followersNumber'] = _followersNumber;
    if (_participants != null) {
      map['participants'] = _participants?.toJson();
    }
    if (_comments != null) {
      map['comments'] = _comments?.toJson();
    }
    if (_streamTime != null) {
      map['streamTime'] = _streamTime?.toJson();
    }
    return map;
  }

}




//
// {
// "isAktive": true,
// "title" : "Event title",
// "category" : "Etkinlik kategorisi",
// "isPrivate" : false,
// "date": "date",
// "time": "time",
// "eventPlaceLocationTitle": "mekan yeri ",
// "location": " dETAYLI ETKINLIK YERI ",
// "image": "imagePath",
// "description": "Aciklama",
// "isCertificated" : false,
// "ticketNumber" : 100,
// "price": 100,
// "postOwner": "paylasanin uid",
// "followersNumber": 1999,
// "participants" : {
// "participantuid" : "profileImagePath"
// },
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