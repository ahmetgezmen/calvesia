import 'dart:convert';
/// image : "ImagePath"
/// title : "Example Title"
/// date : "Event Date"
/// location : "Location Adress"
/// time : "Event Time"
/// participant : "List of Ticket Buyers"

PopularEventCardModel popularEventCardModelFromJson(String str) => PopularEventCardModel.fromJson(json.decode(str));
String popularEventCardModelToJson(PopularEventCardModel data) => json.encode(data.toJson());
class PopularEventCardModel {
  PopularEventCardModel({
      String? image, 
      String? title, 
      String? date, 
      String? location,
      String? time, 
      String? participant,}){
    _image = image;
    _title = title;
    _date = date;
    _location = location;
    _time = time;
    _participant = participant;
}

  PopularEventCardModel.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title'];
    _date = json['date'];
    _location = json['location'];
    _time = json['time'];
    _participant = json['participant'];
  }
  String? _image;
  String? _title;
  String? _date;
  String? _location;
  String? _time;
  String? _participant;
PopularEventCardModel copyWith({  String? image,
  String? title,
  String? date,
  String? location,
  String? time,
  String? participant,
}) => PopularEventCardModel(  image: image ?? _image,
  title: title ?? _title,
  date: date ?? _date,
  location: location ?? _location,
  time: time ?? _time,
  participant: participant ?? _participant,
);
  String? get image => _image;
  String? get title => _title;
  String? get date => _date;
  String? get location => _location;
  String? get time => _time;
  String? get participant => _participant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    map['date'] = _date;
    map['location'] = _location;
    map['time'] = _time;
    map['participant'] = _participant;
    return map;
  }

}