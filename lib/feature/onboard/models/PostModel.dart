import 'dart:convert';

import 'package:calvesia/feature/onboard/models/CommentsModel.dart';
/// title : "ornek title"
/// description : "ornek aciklama "
/// participant : "Katilanlar "
/// price : 12921
/// date : "orenek date"
/// time : "etkinlik saati"
/// comments : {"commentUid":{"uuid":"paylasan kisinin uuid","commentDsc":"Comment aciklamasi","Star":5,"isHelpful":false,"helpfulCount":1000}}
/// image : "pathPhoto"
/// category : "CATAGORI NUMARASI"
/// corporateDesc : "Okul adi/ Kurum adi"
/// speakers : "Eger konusmaci varsa listesi"
/// postOwner : "post paylasanin uid'si "
/// location : "etkinlik nerede yapilacak"
/// followersNumber : 1000

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());
class PostModel {
  PostModel({
      String? title, 
      String? description, 
      String? participant, 
      int? price, 
      String? date, 
      String? time, 
      Comments? comments, 
      String? image, 
      String? category, 
      String? corporateDesc, 
      String? speakers, 
      String? postOwner, 
      String? location, 
      int? followersNumber,}){
    _title = title;
    _description = description;
    _participant = participant;
    _price = price;
    _date = date;
    _time = time;
    _comments = comments;
    _image = image;
    _category = category;
    _corporateDesc = corporateDesc;
    _speakers = speakers;
    _postOwner = postOwner;
    _location = location;
    _followersNumber = followersNumber;
}

  PostModel.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _participant = json['participant'];
    _price = json['price'];
    _date = json['date'];
    _time = json['time'];
    _comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    _image = json['image'];
    _category = json['category'];
    _corporateDesc = json['corporateDesc'];
    _speakers = json['speakers'];
    _postOwner = json['postOwner'];
    _location = json['location'];
    _followersNumber = json['followersNumber'];
  }
  String? _title;
  String? _description;
  String? _participant;
  int? _price;
  String? _date;
  String? _time;
  Comments? _comments;
  String? _image;
  String? _category;
  String? _corporateDesc;
  String? _speakers;
  String? _postOwner;
  String? _location;
  int? _followersNumber;
PostModel copyWith({  String? title,
  String? description,
  String? participant,
  int? price,
  String? date,
  String? time,
  Comments? comments,
  String? image,
  String? category,
  String? corporateDesc,
  String? speakers,
  String? postOwner,
  String? location,
  int? followersNumber,
}) => PostModel(  title: title ?? _title,
  description: description ?? _description,
  participant: participant ?? _participant,
  price: price ?? _price,
  date: date ?? _date,
  time: time ?? _time,
  comments: comments ?? _comments,
  image: image ?? _image,
  category: category ?? _category,
  corporateDesc: corporateDesc ?? _corporateDesc,
  speakers: speakers ?? _speakers,
  postOwner: postOwner ?? _postOwner,
  location: location ?? _location,
  followersNumber: followersNumber ?? _followersNumber,
);
  String? get title => _title;
  String? get description => _description;
  String? get participant => _participant;
  int? get price => _price;
  String? get date => _date;
  String? get time => _time;
  Comments? get comments => _comments;
  String? get image => _image;
  String? get category => _category;
  String? get corporateDesc => _corporateDesc;
  String? get speakers => _speakers;
  String? get postOwner => _postOwner;
  String? get location => _location;
  int? get followersNumber => _followersNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['participant'] = _participant;
    map['price'] = _price;
    map['date'] = _date;
    map['time'] = _time;
    if (_comments != null) {
      map['comments'] = _comments?.toJson();
    }
    map['image'] = _image;
    map['category'] = _category;
    map['corporateDesc'] = _corporateDesc;
    map['speakers'] = _speakers;
    map['postOwner'] = _postOwner;
    map['location'] = _location;
    map['followersNumber'] = _followersNumber;
    return map;
  }

}
